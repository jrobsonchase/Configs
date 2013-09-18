source "gpg2 -dq $HOME/.mutt/gmail.gpg |"

account-hook gmail.com 'set imap_user=jcjoshuachase@gmail.com imap_pass=$my_gmail_pass'

set folder		= imaps://imap.gmail.com/
set spoolfile = +INBOX
mailboxes +INBOX
unset postponed
unset record

set realname = "Josh Chase"
set from=jcjoshuachase@gmail.com
set hostname=gmail.com

# specify the uid to use when encrypting/signing
set pgp_sign_as=0xEC950614
source ~/.mutt/gpg-encryptsign

set smtp_url=smtps://$imap_user:$imap_pass@smtp.gmail.com

alternates "jechas01@louisville.edu|jechas01@cardmail.louisville.edu|jcjoshuachase@gmail.com"
set reverse_name
