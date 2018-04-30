#!/bin/sh
echo "Tagging new mail"
notmuch new

notmuch tag -inbox -unread -- '(to: narwhal-team@datameer.com or to:orca-team@datameer.com) and subject:JIRA'

# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -inbox +sent -- '(from:fabian.bull@datameer.com \
    or from:bull.fabian@googlemail.com \
    or from:fabian.bull@bioinform.at \
    or from:spam@bioinform.at \
    or from:fabian.bull@informatik.uni-halle.de) \
    and not tag:sent'

echo "Done"
