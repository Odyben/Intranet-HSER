<?php
// SMTP credentials for outgoing notification emails (booking approvals,
// staff broadcasts). Uses a Gmail account + App Password rather than MOH's
// own mail server, since that would need a formal request through KKM's
// central IT — same kind of delay as the MyGovNet situation.
//
// ==== SETUP (one-time) ====
// 1. Create (or pick) a Gmail account to send from, e.g.
//    noreply.intranethserian@gmail.com
// 2. Turn on 2-Step Verification on that account (Google Account > Security)
// 3. Go to https://myaccount.google.com/apppasswords and generate an App
//    Password for "Mail" — it's a 16-character code, NOT the account's
//    normal login password.
// 4. Paste the Gmail address and the 16-character App Password below.
// ===========================

define('SMTP_HOST', 'smtp.gmail.com');
define('SMTP_PORT', 587);
define('SMTP_USERNAME', 'intranethser@gmail.com');
define('SMTP_PASSWORD', 'dqadyvfwtltqbviv');
define('SMTP_FROM_EMAIL', 'intranethser@gmail.com');
define('SMTP_FROM_NAME', 'Intranet Hospital Serian');
?>
