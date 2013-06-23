source "gpg2 --no-tty -dq $HOME/.mutt/grumpyjosh.gpg |"

account-hook grumpyjosh.com 'set imap_user=josh imap_pass=$my_grumpy_pass'

set my_host = grumpyjosh.com
set folder		= imaps://$my_host/
set spoolfile = +INBOX
mailboxes +INBOX
set postponed = +Drafts
set record = +Sent

set message_cachedir = "~/.cache/mutt"
set header_cache = "~/.cache/mutt"

set realname = "Josh"
set from=josh@grumpyjosh.com
set hostname=grumpyjosh.com

# specify the uid to use when encrypting/signing
source ~/.mutt/gpg-verify

set smtp_url = smtp://$imap_user:$imap_pass@$my_host:587

macro index E <shell-escape>"vim ~/.sieve"<enter>
macro index S <shell-escape>"pushd ~/.sieve && echo $imap_pass | sieve-connect $my_host --nosslverify --user $imap_user; popd"<enter>
