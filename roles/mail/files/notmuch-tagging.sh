#!/bin/sh
echo "Tagging new mail"
notmuch new

notmuch tag +jira 'subject:[JIRA] from:r2d2@datameer.com'
notmuch tag +gh 'from:notifications@github.com'

# mark all unimportant emails as read and remove it from the inbox
notmuch tag -inbox -unread -- 'tag:gh and -@peri4n'
notmuch tag -inbox -unread -- 'to:orca-team@datameer.com'
notmuch tag -inbox -unread -- 'to:narwhal-team@datameer.com and tag:jira'

# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -inbox +sent -- '(from:fabian.bull@datameer.com \
    or from:bull.fabian@googlemail.com \
    or from:fabian.bull@bioinform.at \
    or from:spam@bioinform.at \
    or from:fabian.bull@informatik.uni-halle.de) \
    and not tag:sent'

echo "Done"
