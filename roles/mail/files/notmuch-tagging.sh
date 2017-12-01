#!/bin/sh
echo "Tagging new mail"
notmuch new

# Remove orca emails from inbox
notmuch tag -new -inbox -- to:orca-team@datameer.com

# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -new -inbox +sent -- (from:fabian.bull@datameer.com \
    or from:bull.fabian@googlemail.com \
    or from:fabian.bull@bioinform.at \
    or from:spam@bioinform.at \
    or from:fabian.bull@informatik.uni-halle.de) \
    and not tag:sent

echo "Done"
