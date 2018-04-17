#!/bin/bash



# Lets check the PO files
#
#
# Version: 4
# Author: scootergrisen (https://www.phpbb.com/community/memberlist.php?mode=viewprofile&u=1329459)
# Year: 2018
# License: GNU GPL 3 (https://www.gnu.org/licenses/)
# Code: https://github.com/scootergrisen/phpbbpo



# --output-file=/dev/null
#        avoids creating the message.mo file that would otherwise be created

for f in $(find po/ -name "*.po"); do echo "Checking $f:"; msgfmt --output-file=/dev/null $f; echo ""; done
