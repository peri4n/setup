#!/bin/sh
echo "Tagging new mail"
notmuch new

notmuch tag +jira 'subject:[JIRA] from:r2d2@datameer.com'

# mark all unimportant emails as read and remove it from the inbox
notmuch tag -inbox -unread -- 'to:orca-team@datameer.com'
notmuch tag -inbox -unread -- 'to:narwhal-team@datameer.com and tag:jira'

echo "Done"
