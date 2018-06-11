# mail-blacklist-check
A shell script for checking whether mail servers are listed on common blacklists.
It is intended to be integrated into monitoring tools or cron jobs.

It's still a work in progress, but it does work.

# Blacklists
The script reads files from the ./blacklists/ folder that end in ".blacklist"

It comes with a default blacklist that shouldn't have too many overly-aggressive
lists on it. If you want to add additional ones, create a new file so that you
can update to new versions of mail-blacklist-check without having to merge your
edits.
