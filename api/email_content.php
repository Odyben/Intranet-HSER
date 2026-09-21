<?php
// Menapis kandungan emel yang ditulis admin dalam ruangan rich-text.
//
// Dua kerja:
//   1. Tapis HTML kepada senarai tag/atribut yang dibenarkan sahaja. Admin
//      memang dipercayai, tetapi mesej ini pergi kepada 150+ mailbox — markup
//      bersih mengelakkan paparan rosak, dan menapis atribut seperti on* /
//      javascript: menutup laluan penyalahgunaan kalau akaun admin dibocorkan.
//   2. Tukar gambar yang ditampal (data: URI) kepada imej terbenam CID.
//      Gmail dan kebanyakan klien emel menyekat atau membuang <img src="data:">,
//      jadi gambar poster yang ditampal takkan kelihatan kalau dibiar begitu.

const EMAIL_HTML_TAGS = [
    'b' => [], 'strong' => [], 'i' => [], 'em' => [], 'u' => [],
    'br' => [], 'p' => [], 'div' => [], 'span' => [],
    'ul' => [], 'ol' => [], 'li' => [], 'blockquote' => [],
    'h3' => [], 'h4' => [],
    'a'  => ['href'],
    'img' => ['src', 'alt', 'width', 'height'],
];

// Tag ini dibuang terus bersama kandungannya. Kalau ia sekadar dinyahbalut
// seperti tag lain yang tidak dibenarkan, kod di dalamnya akan terpapar
// sebagai teks biasa dalam emel.
const EMAIL_TAGS_BUANG = ['script', 'style', 'noscript', 'iframe', 'object', 'embed', 'link', 'meta', 'title'];

const EMAIL_IMG_TYPES = [
    'image/png'  => 'png',
    'image/jpeg' => 'jpg',
    'image/jpg'  => 'jpg',
    'image/gif'  => 'gif',
    'image/webp' => 'webp',
];

const EMAIL_MAX_EMBEDDED   = 10;
const EMAIL_MAX_IMG_BYTES  = 5 * 1024 * 1024;   // satu imej
// Imej + lampiran, saiz sebenar. Dihadkan 15MB kerana emel dikodkan base64
// semasa dihantar, yang membesarkannya ~33% — 15MB menjadi ~20MB di dalam
// emel, masih bawah had 25MB Gmail.
const EMAIL_MAX_TOTAL_BYTES = 15 * 1024 * 1024;

/**
 * @param  string $html   HTML mentah dari ruangan rich-text
 * @param  array  $embed  (output) imej terbenam: ['data','cid','name','type']
 * @return array          ['html' => string, 'bytes' => int, 'error' => string|null]
 */
function sanitizeEmailHtml($html, &$embed) {
    $embed = [];
    $bytes = 0;

    if (trim($html) === '') return ['html' => '', 'bytes' => 0, 'error' => null];

    $doc = new DOMDocument();
    libxml_use_internal_errors(true);
    // Bungkus dalam satu akar supaya kandungan berbilang nod boleh dibaca
    // semula dengan mudah; pengisytiharan XML memaksa tafsiran UTF-8.
    $ok = $doc->loadHTML(
        '<?xml encoding="utf-8" ?><body><div id="akar">' . $html . '</div></body>',
        LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD
    );
    libxml_clear_errors();
    if (!$ok) return ['html' => '', 'bytes' => 0, 'error' => 'Format mesej tidak sah'];

    $akar = $doc->getElementById('akar');
    if (!$akar) return ['html' => '', 'bytes' => 0, 'error' => 'Format mesej tidak sah'];

    $ralat = null;
    $bersihkan = function (DOMNode $nod) use (&$bersihkan, &$embed, &$bytes, &$ralat, $doc) {
        // Salin dulu — senarai anak berubah semasa kita membuang nod
        foreach (iterator_to_array($nod->childNodes) as $anak) {
            if ($anak->nodeType === XML_TEXT_NODE) continue;

            if ($anak->nodeType !== XML_ELEMENT_NODE) {   // komen, CDATA, dll
                $anak->parentNode->removeChild($anak);
                continue;
            }

            $tag = strtolower($anak->nodeName);

            if (in_array($tag, EMAIL_TAGS_BUANG, true)) {
                $anak->parentNode->removeChild($anak);
                continue;
            }

            if (!isset(EMAIL_HTML_TAGS[$tag])) {
                // Tag tidak dibenarkan: kekalkan teks di dalamnya, buang tag
                $bersihkan($anak);
                while ($anak->firstChild) {
                    $anak->parentNode->insertBefore($anak->firstChild, $anak);
                }
                $anak->parentNode->removeChild($anak);
                continue;
            }

            $dibenar = EMAIL_HTML_TAGS[$tag];
            foreach (iterator_to_array($anak->attributes) as $attr) {
                if (!in_array(strtolower($attr->nodeName), $dibenar, true)) {
                    $anak->removeAttribute($attr->nodeName);
                }
            }

            if ($tag === 'a') {
                $href = $anak->getAttribute('href');
                if (!preg_match('#^(https?://|mailto:)#i', $href)) {
                    $anak->removeAttribute('href');
                } else {
                    $anak->setAttribute('target', '_blank');
                }
            }

            if ($tag === 'img') {
                $src = $anak->getAttribute('src');
                if (preg_match('#^data:([a-z/+.-]+);base64,(.+)$#is', $src, $m)) {
                    $jenis = strtolower(trim($m[1]));
                    if (!isset(EMAIL_IMG_TYPES[$jenis])) {
                        $anak->parentNode->removeChild($anak);
                        $ralat = $ralat ?: 'Jenis imej tidak disokong. Guna PNG, JPG, GIF atau WEBP.';
                        continue;
                    }
                    if (count($embed) >= EMAIL_MAX_EMBEDDED) {
                        $anak->parentNode->removeChild($anak);
                        $ralat = $ralat ?: 'Terlalu banyak gambar dalam mesej (maksimum ' . EMAIL_MAX_EMBEDDED . ').';
                        continue;
                    }
                    $binari = base64_decode($m[2], true);
                    if ($binari === false || strlen($binari) === 0) {
                        $anak->parentNode->removeChild($anak);
                        $ralat = $ralat ?: 'Satu gambar dalam mesej rosak dan tidak dapat dibaca.';
                        continue;
                    }
                    if (strlen($binari) > EMAIL_MAX_IMG_BYTES) {
                        $anak->parentNode->removeChild($anak);
                        $ralat = $ralat ?: 'Gambar dalam mesej terlalu besar (had ' . round(EMAIL_MAX_IMG_BYTES / 1048576) . 'MB setiap satu).';
                        continue;
                    }
                    // Sahkan ia benar-benar imej, bukan fail lain yang dilabel imej
                    if (function_exists('getimagesizefromstring') && @getimagesizefromstring($binari) === false) {
                        $anak->parentNode->removeChild($anak);
                        $ralat = $ralat ?: 'Satu fail dalam mesej bukan imej yang sah.';
                        continue;
                    }

                    $n = count($embed) + 1;
                    $cid = 'imej' . $n . '@intranethser';
                    $embed[] = [
                        'data' => $binari,
                        'cid'  => $cid,
                        'name' => 'imej' . $n . '.' . EMAIL_IMG_TYPES[$jenis],
                        'type' => $jenis === 'image/jpg' ? 'image/jpeg' : $jenis,
                    ];
                    $bytes += strlen($binari);
                    $anak->setAttribute('src', 'cid:' . $cid);
                    // Pastikan gambar besar tidak melimpah keluar lebar emel
                    $anak->setAttribute('style', 'max-width:100%; height:auto; display:block; margin:12px 0;');
                } elseif (!preg_match('#^cid:#i', $src)) {
                    // Imej dari URL luar dibuang — banyak klien emel menyekatnya
                    // dan ia membocorkan bila emel dibuka kepada hos luar.
                    $anak->parentNode->removeChild($anak);
                    continue;
                }
            }

            $bersihkan($anak);
        }
    };
    $bersihkan($akar);

    $keluar = '';
    foreach ($akar->childNodes as $anak) {
        $keluar .= $doc->saveHTML($anak);
    }

    return ['html' => trim($keluar), 'bytes' => $bytes, 'error' => $ralat];
}

/**
 * Sahkan fail lampiran yang dimuat naik.
 * @return array ['files' => [['path','name','size']], 'bytes' => int, 'error' => string|null]
 */
function collectEmailAttachments($field = 'attachments', $bytesSedia = 0) {
    $dibenar = ['pdf', 'jpg', 'jpeg', 'png', 'gif', 'webp', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'csv'];
    $maxSatu = 10 * 1024 * 1024;
    $maxBil  = 10;

    $files = [];
    $bytes = $bytesSedia;

    if (empty($_FILES[$field]) || !isset($_FILES[$field]['name'])) {
        return ['files' => [], 'bytes' => $bytes, 'error' => null];
    }

    $f = $_FILES[$field];
    $bil = is_array($f['name']) ? count($f['name']) : 1;
    if ($bil > $maxBil) {
        return ['files' => [], 'bytes' => $bytes, 'error' => 'Terlalu banyak lampiran (maksimum ' . $maxBil . ' fail).'];
    }

    for ($i = 0; $i < $bil; $i++) {
        $nama = is_array($f['name']) ? $f['name'][$i] : $f['name'];
        $tmp  = is_array($f['tmp_name']) ? $f['tmp_name'][$i] : $f['tmp_name'];
        $kod  = is_array($f['error']) ? $f['error'][$i] : $f['error'];
        $saiz = is_array($f['size']) ? $f['size'][$i] : $f['size'];

        if ($kod === UPLOAD_ERR_NO_FILE) continue;
        if ($kod !== UPLOAD_ERR_OK) {
            return ['files' => [], 'bytes' => $bytes, 'error' => 'Gagal memuat naik lampiran: ' . $nama];
        }
        if (!is_uploaded_file($tmp)) {
            return ['files' => [], 'bytes' => $bytes, 'error' => 'Lampiran tidak sah: ' . $nama];
        }

        $ext = strtolower(pathinfo($nama, PATHINFO_EXTENSION));
        if (!in_array($ext, $dibenar, true)) {
            return ['files' => [], 'bytes' => $bytes,
                    'error' => 'Jenis fail "' . $ext . '" tidak dibenarkan. Guna: ' . implode(', ', $dibenar)];
        }
        if ($saiz > $maxSatu) {
            return ['files' => [], 'bytes' => $bytes,
                    'error' => 'Fail "' . $nama . '" melebihi ' . round($maxSatu / 1048576) . 'MB.'];
        }

        $bytes += $saiz;
        if ($bytes > EMAIL_MAX_TOTAL_BYTES) {
            return ['files' => [], 'bytes' => $bytes,
                    'error' => 'Jumlah saiz emel melebihi ' . round(EMAIL_MAX_TOTAL_BYTES / 1048576) . 'MB. Kurangkan lampiran atau gambar.'];
        }

        // Nama fail dibersihkan supaya tiada laluan direktori masuk ke header emel
        $files[] = ['path' => $tmp, 'name' => basename(str_replace('\\', '/', $nama)), 'size' => $saiz];
    }

    return ['files' => $files, 'bytes' => $bytes, 'error' => null];
}
?>
