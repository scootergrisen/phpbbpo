#!/bin/sh



# PO converter for phpBB language packs
# Extracts the strings from the php files and puts them in a single PO file
#
# Version: 1
# Author: scootergrisen (https://www.phpbb.com/community/memberlist.php?mode=viewprofile&u=1329459)
# Year: 2018
# License: GNU GPL 3



################
# Introduction #
################

# This script extracts strings from two phpBB language packs
# and combines the strings in a PO file.

# The PO file can opened in lots of software to check for errors
# like missing "." at the end of a string that is there in the
# source languges but not in the translation

# Feel free to use this script as you like.
# You can help improve it so it can be even better



##########################
# How to use this script #
##########################

# Go to https://www.phpbb.com/languages/
# Download to language packs of the same version

# Example:
# british_english_3_2_2.zip (source)
# danish_3_2_2.zip (translation)

# Create a new folder.
# Extract the zip files in the new folder.
# Place this file in it and run it:
# ./po.sh



####################
# Uses these tools #
####################

# php - so you have to have it installed
# sed - dont know this is always available



#################################
# Software to check the PO file #
#################################

# Here are some tools you can use to check the PO file:
# gettext https://www.gnu.org/software/gettext/
# PyG3T https://github.com/pyg3t/pyg3t
# Translate Toolkit http://toolkit.translatehouse.org/
# GUI:
# Virtaal http://virtaal.translatehouse.org/
# Poedit https://poedit.net/
# Qt Linguist https://doc.qt.io/qt-5/linguist-translators.html



# Remove files (so we don't append to existing files)
#  -f, --force           ignore nonexistent files and arguments, never prompt
rm -f .output.a.php
rm -f .output.b.php
rm -f .output.php
rm -f output.po



# Create files to avoid some error messsages about files not existing
touch .output.a.php
touch .output.b.php
touch .output.php



# Gather all the php files to a single file
# Change the folder name on the second line to the folder of the language you want use (gaelic_3_2_2, greek_3_2_2, slovak_3_2_2, etc.)
#for f in $(find mandarin_chinese_simplified_script_18_03_0/ -name "*.php"); do cat $f >> output.a.php; done
#for f in $(find gaelic_3_2_2/ -name "*.php"); do cat $f >> output.b.php; done



usage() { echo "Usage: $0 -a <first folder> -b <second folder>" 1>&2; exit 1; }

while getopts ":a:b:" opt; do
  case $opt in
    a)
      for f in $(find $OPTARG -name "*.php"); do cat $f >> .output.a.php; done
      for f in $(find $OPTARG -name "iso.txt"); do languageinenglisha=$(head -n 1 $f); done
      ;;
    b)
      for f in $(find $OPTARG -name "*.php"); do cat $f >> .output.b.php; done
      for f in $(find $OPTARG -name "iso.txt"); do languageinenglishb=$(head -n 1 $f); done

      # temporary solution to get language code for PO file header
      case $OPTARG in
        american_english_3_2_0|american_english_3_2_0/|zipextracted/american_english_3_2_0/)
            languagecode="en-us"
            ;;
        arabic_3_2_2|arabic_3_2_2/|zipextracted/arabic_3_2_2/)
            languagecode="ar"
            ;;
        brazilian_portuguese_1_3_2|brazilian_portuguese_1_3_2/|zipextracted/brazilian_portuguese_1_3_2/)
            languagecode="pt-br"
            ;;
        british_english_3_2_2|british_english_3_2_2/|zipextracted/british_english_3_2_2/)
            languagecode="en-gb"
            ;;
        catalan_2_1_3|catalan_2_1_3/|zipextracted/catalan_2_1_3/)
            languagecode="ca"
            ;;
        croatian_casual_honorifics_3_2_2|croatian_casual_honorifics_3_2_2/|zipextracted/croatian_casual_honorifics_3_2_2/)
            languagecode="hr"
            ;;
        croatian_formal_honorifics_3_2_2|croatian_formal_honorifics_3_2_2/|zipextracted/croatian_formal_honorifics_3_2_2/)
            languagecode="hr-x-vi"
            ;;
        danish_3_2_2|danish_3_2_2/|zipextracted/danish_3_2_2/)
            languagecode="da"
            ;;
        dutch_casual_honorifics_2_1_2|dutch_casual_honorifics_2_1_2/|zipextracted/dutch_casual_honorifics_2_1_2/)
            languagecode="nl-nl"
            ;;
        french_3_2_0|french_3_2_0/|zipextracted/french_3_2_0/)
            languagecode="fr"
            ;;
        gaelic_3_2_2|gaelic_3_2_2/|zipextracted/gaelic_3_2_2/)
            languagecode="gd"
            ;;
        german_casual_honorifics_3_2_2|german_casual_honorifics_3_2_2/|zipextracted/german_casual_honorifics_3_2_2/)
            languagecode="de"
            ;;
        german_formal_honorifics_3_2_2|german_formal_honorifics_3_2_2/|zipextracted/german_formal_honorifics_3_2_2/)
            languagecode="de-x-sie"
            ;;
        greek_3_2_2|greek_3_2_2/|zipextracted/greek_3_2_2/)
            languagecode="el"
            ;;
        mandarin_chinese_simplified_script_18_03_0|mandarin_chinese_simplified_script_18_03_0/|zipextracted/mandarin_chinese_simplified_script_18_03_0/)
            languagecode="zh-cmn-hans"
            ;;
        mandarin_chinese_traditional_script_3_2_2|mandarin_chinese_traditional_script_3_2_2/|zipextracted/mandarin_chinese_traditional_script_3_2_2/)
            languagecode="zh-cmn-hant"
            ;;
        persian_3_2_2|persian_3_2_2/|zipextracted/persian_3_2_2/)
            languagecode="fa"
            ;;
        polish_3_2_2|polish_3_2_2/|zipextracted/polish_3_2_2/)
            languagecode="pl"
            ;;
        portuguese_3_1_1|portuguese_3_1_1/|zipextracted/portuguese_3_1_1/)
            languagecode="pt"
            ;;
        russian_2_0_2|russian_2_0_2/|zipextracted/russian_2_0_2/)
            languagecode="ru"
            ;;
        slovak_3_2_2|slovak_3_2_2/|zipextracted/slovak_3_2_2/)
            languagecode="sk-SK"
            ;;
        spanish_casual_honorifics_3_2_2|spanish_casual_honorifics_3_2_2/|zipextracted/spanish_casual_honorifics_3_2_2/)
            languagecode="es-x-tu"
            ;;
        spanish_formal_honorifics_3_2_2|spanish_formal_honorifics_3_2_2/|zipextracted/spanish_formal_honorifics_3_2_2/)
            languagecode="es"
            ;;
        turkish_1_2_2|turkish_1_2_2/|zipextracted/turkish_1_2_2/)
            languagecode="tr"
            ;;
        ukrainian_1_2_3|ukrainian_1_2_3/|zipextracted/ukrainian_1_2_3/)
            languagecode="uk"
            ;;
        *)
            languagecode="unknown"
            ;;
      esac

      echo "Creating PO file from $languageinenglisha <=> $languageinenglishb [$languagecode]";
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
    *)
      usage
      exit 1
      ;;
  esac
done



writetooutputboth() {

# Add this code to the bottom of the file (it echos $lang the way we want):
cat <<OUTPUT >> .output.php

echo '# phpBB language pack strings
# Converted from $languageinenglisha and $languageinenglishb php files
msgid ""
msgstr ""
"Project-Id-Version: $languageinenglishb language pack phpBB\\n"
"Report-Msgid-Bugs-To: \\n"
"POT-Creation-Date: 0000-00-00 00:00-0000\\n"
"PO-Revision-Date: 0000-00-00 00:00-0000\\n"
"Last-Translator: \\n"
"Language-Team: $languageinenglishb\\n"
"Language: $languagecode\\n"
"MIME-Version: 1.0\\n"
"Content-Type: text/plain; charset=UTF-8\\n"
"Content-Transfer-Encoding: 8bit\\n"
"Plural-Forms: nplurals=2; plural=(n != 1);\\n"

';

\$oversettelse_a = array();
\$oversettelse_b = array();

// Fix the strings so they can be in msgid and msgstr
\$erstatfra = array('"', "\n");
\$erstattil = array('\"', "\\\n");

foreach (\$lang_a as \$keya => \$valuea) {

    if (!is_array(\$valuea)) {

        \$oversettelse_a[\$keya] = str_replace(\$erstatfra, \$erstattil, \$valuea);

    }

}

foreach (\$lang_b as \$keya => \$valuea) {

    if (!is_array(\$valuea)) {

        \$oversettelse_b[\$keya] = str_replace(\$erstatfra, \$erstattil, \$valuea);

    }

}

foreach (\$oversettelse_a as \$keya => \$valuea) {

    if (\$keya == "dateformats" || \$keya == "datetime" || \$keya == "report_reasons" || \$keya == "TRANSLATION_INFO") {
    
        // skip at the moment (fix later)
    
    } else {
    
        echo '#. ' . \$keya . "\n";
    
        if (!is_array(\$valuea)) {
    
            // Avoid a few empty strings that podiff would otherwise complain about
            if (\$keya != '' && \$valuea != '') {

                echo 'msgctxt "' . \$keya . '"' . "\n";
                echo 'msgid "' . \$oversettelse_a[\$keya] . '"' . "\n";
                echo 'msgstr "' . \$oversettelse_b[\$keya] . '"' . "\n";
                echo "\n";
    
            }

        } else {
    
            foreach (\$valuea as \$keyb => \$valueb) {
    
                if (!is_array(\$valueb)) {

                    echo 'msgctxt "' . \$keya . '"' . "\n";
                    echo 'msgid "' . \$oversettelse_a[\$keya][\$keyb] . '"' . "\n";
                    echo 'msgstr "' . \$oversettelse_b[\$keya][\$keyb] . '"' . "\n";
                    echo "\n";
    
                } else {
    
                    foreach (\$valueb as \$keyc => \$valuec) {
    
                        if (!is_array(\$valuec)) {
    
                            echo 'msgctxt "' . \$keya . '"' . "\n";
                            echo 'msgid "' . \$oversettelse_a[\$keya][\$keyc] . '"' . "\n";
                            echo 'msgstr "' . \$oversettelse_b[\$keya][\$keyc] . '"' . "\n";
                            echo "\n";
    
                        } else {
    
                            foreach (\$valuec as \$keyd => \$valued) {
    
                                echo 'msgctxt "' . \$keya . '"' . "\n";
                                echo 'msgid "' . \$oversettelse_a[\$keya][\$keyd] . '"' . "\n";
                                echo 'msgstr "' . \$oversettelse_b[\$keya][\$keyd] . '"' . "\n";
                                echo "\n";
    
                            }
    
                        }
    
                    }
    
                }
    
            }
    
        }
    
    }

}
OUTPUT

}



if [ -e .output.a.php ] && [ -e .output.b.php ] && [ -e .output.php ]
then

    # Change $lang to $lang_a and $lang_b
    sed -i -e 's/$lang/$lang_a/g' .output.a.php
    sed -i -e 's/$lang/$lang_b/g' .output.b.php

    # Remove all the "<?php" (we only need one at the beginning of the file):
    sed -i -e 's/<?php//g' .output.a.php
    sed -i -e 's/<?php//g' .output.b.php

    # Gather the files into one file
    cat .output.a.php >> .output.php;
    cat .output.b.php >> .output.php;
    
    # Add "<?php" to the beginning of the file and enable error messages in case something goes wrong:
    #sed -i '1s/^/ini_set("display_errors", "On");\n/' .output.php
    #sed -i '1s/^/ini_set("display_startup_errors", "On");\n/' .output.php
    #sed -i '1s/^/ini_set("error_reporting", -1);\n/' .output.php
    sed -i '1s/^/define("IN_PHPBB", true);\n/' .output.php
    sed -i '1s/^/<?php\n/' .output.php

    writetooutputboth

fi



# Create the PO file
php .output.php > output.po



# Remove temporary files no longer needed
rm -f .output.a.php
rm -f .output.b.php
rm -f .output.php
