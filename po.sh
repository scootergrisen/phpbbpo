#!/bin/bash



# PO converter for phpBB language packs
# Extracts strings from the php files and puts them in a single PO file
#
# Version: 4
# Author: scootergrisen (https://www.phpbb.com/community/memberlist.php?mode=viewprofile&u=1329459)
# Year: 2018
# License: GNU GPL 3 (https://www.gnu.org/licenses/)
# Code: https://github.com/scootergrisen/phpbbpo


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
# Download two language packs (of the same version)

# Example:
# Download british_english_3_2_2.zip (source)
# Download danish_3_2_2.zip (translation)

# Extract the zip files in the zipextracted/ folder.
# Place this file in it and run:
# ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/danish_3_2_2/

# danish_3_2_2.po should be in po/danish_3_2_2.po



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



# Variables

declare languageinenglisha;
declare languageinenglishb;
declare newfilename;
declare languagecode;
declare osfofsofinonsf;



# Remove temporary files
if [ -e temp/ ]
then
    rm -fr temp/
fi



# Create dir for the temporary files
if ! [ -e temp/ ]
then
    mkdir temp/
fi



# Create dir for the PO file
if ! [ -e po/ ]
then
    mkdir po/
fi



# Create files to avoid some error messsages about files not existing
touch temp/output.a.php
touch temp/output.b.php
touch temp/output.php



# Gather all the php files to a single file
# Change the folder name on the second line to the folder of the language you want use (gaelic_3_2_2, greek_3_2_2, slovak_3_2_2, etc.)
#for f in $(find mandarin_chinese_simplified_script_18_03_0/ -name "*.php"); do cat $f >> output.a.php; done
#for f in $(find gaelic_3_2_2/ -name "*.php"); do cat $f >> output.b.php; done



usagetext() {

    echo "Usage: $0 [-a <first folder> -b <second folder>] [-c]"
    echo "Extracts strings from two phpBB language packs"
    echo "and combines the strings in a PO file."
    echo ""
    echo "-a <folder>    Content of unpacked language pack zip file"
    echo "               (usually the source language which is british_english_[VERSION]"
    echo "-b <folder>    Content of unpacked language pack zip file"
    echo "               (usually the translation you work on e.g. danish_[VERSION]"
    echo "               Source and translation should be the same version"
    echo "-c             Delete the temporary files and folder"
    echo "               (temp/, zip/, zipextracted/, po/)"
    echo "-v             Version information"

}



usage() { usagetext 1>&2; exit 1; }

while getopts ":a:b:cvh" opt; do
  case $opt in
    a)
      for f in $(find $OPTARG -name "*.php"); do osfofsofinonsf=$f; echo -e "●\c"; cat $f >> temp/output.a.php; done
      for f in $(find $OPTARG -name "iso.txt"); do languageinenglisha=$(head -n 1 $f); done
      ;;
    b)
      for f in $(find $OPTARG -name "*.php"); do osfofsofinonsf=$f; echo -e "●\c"; cat $f >> temp/output.b.php; done
      for f in $(find $OPTARG -name "iso.txt"); do languageinenglishb=$(head -n 1 $f); done
      echo "";

      # temporary solution to get language code for PO file header
      case $OPTARG in
        # 3.2.2:
        american_english_3_2_0|american_english_3_2_0/|zipextracted/american_english_3_2_0/)
            newfilename="american_english_3_2_0.po"
            languagecode="en-us"
            ;;
        arabic_3_2_2|arabic_3_2_2/|zipextracted/arabic_3_2_2/)
            newfilename="arabic_3_2_2.po"
            languagecode="ar"
            ;;
        brazilian_portuguese_1_3_2|brazilian_portuguese_1_3_2/|zipextracted/brazilian_portuguese_1_3_2/)
            newfilename="brazilian_portuguese_1_3_2.po"
            languagecode="pt-br"
            ;;
        british_english_3_2_2|british_english_3_2_2/|zipextracted/british_english_3_2_2/)
            newfilename="british_english_3_2_2.po"
            languagecode="en-gb"
            ;;
        catalan_2_1_3|catalan_2_1_3/|zipextracted/catalan_2_1_3/)
            newfilename="catalan_2_1_3.po"
            languagecode="ca"
            ;;
        croatian_casual_honorifics_3_2_2|croatian_casual_honorifics_3_2_2/|zipextracted/croatian_casual_honorifics_3_2_2/)
            newfilename="croatian_casual_honorifics_3_2_2.po"
            languagecode="hr"
            ;;
        croatian_formal_honorifics_3_2_2|croatian_formal_honorifics_3_2_2/|zipextracted/croatian_formal_honorifics_3_2_2/)
            newfilename="croatian_formal_honorifics_3_2_2.po"
            languagecode="hr-x-vi"
            ;;
        danish_3_2_2|danish_3_2_2/|zipextracted/danish_3_2_2/)
            newfilename="danish_3_2_2.po"
            languagecode="da"
            ;;
        dutch_casual_honorifics_2_1_2|dutch_casual_honorifics_2_1_2/|zipextracted/dutch_casual_honorifics_2_1_2/)
            newfilename="dutch_casual_honorifics_2_1_2.po"
            languagecode="nl-nl"
            ;;
        french_3_2_0|french_3_2_0/|zipextracted/french_3_2_0/)
            newfilename="french_3_2_0.po"
            languagecode="fr"
            ;;
        gaelic_3_2_2|gaelic_3_2_2/|zipextracted/gaelic_3_2_2/)
            newfilename="gaelic_3_2_2.po"
            languagecode="gd"
            ;;
        german_casual_honorifics_3_2_2|german_casual_honorifics_3_2_2/|zipextracted/german_casual_honorifics_3_2_2/)
            newfilename="german_casual_honorifics_3_2_2.po"
            languagecode="de"
            ;;
        german_formal_honorifics_3_2_2|german_formal_honorifics_3_2_2/|zipextracted/german_formal_honorifics_3_2_2/)
            newfilename="german_formal_honorifics_3_2_2.po"
            languagecode="de-x-sie"
            ;;
        greek_3_2_2|greek_3_2_2/|zipextracted/greek_3_2_2/)
            newfilename="greek_3_2_2.po"
            languagecode="el"
            ;;
        mandarin_chinese_simplified_script_18_03_0|mandarin_chinese_simplified_script_18_03_0/|zipextracted/mandarin_chinese_simplified_script_18_03_0/)
            newfilename="mandarin_chinese_simplified_script_18_03_0.po"
            languagecode="zh-cmn-hans"
            ;;
        mandarin_chinese_traditional_script_3_2_2|mandarin_chinese_traditional_script_3_2_2/|zipextracted/mandarin_chinese_traditional_script_3_2_2/)
            newfilename="mandarin_chinese_traditional_script_3_2_2.po"
            languagecode="zh-cmn-hant"
            ;;
        persian_3_2_2|persian_3_2_2/|zipextracted/persian_3_2_2/)
            newfilename="persian_3_2_2.po"
            languagecode="fa"
            ;;
        polish_3_2_2|polish_3_2_2/|zipextracted/polish_3_2_2/)
            newfilename="polish_3_2_2.po"
            languagecode="pl"
            ;;
        portuguese_3_1_1|portuguese_3_1_1/|zipextracted/portuguese_3_1_1/)
            newfilename="portuguese_3_1_1.po"
            languagecode="pt"
            ;;
        russian_2_0_2|russian_2_0_2/|zipextracted/russian_2_0_2/)
            newfilename="russian_2_0_2.po"
            languagecode="ru"
            ;;
        slovak_3_2_2|slovak_3_2_2/|zipextracted/slovak_3_2_2/)
            newfilename="slovak_3_2_2.po"
            languagecode="sk-SK"
            ;;
        spanish_casual_honorifics_3_2_2|spanish_casual_honorifics_3_2_2/|zipextracted/spanish_casual_honorifics_3_2_2/)
            newfilename="spanish_casual_honorifics_3_2_2.po"
            languagecode="es-x-tu"
            ;;
        spanish_formal_honorifics_3_2_2|spanish_formal_honorifics_3_2_2/|zipextracted/spanish_formal_honorifics_3_2_2/)
            newfilename="spanish_formal_honorifics_3_2_2.po"
            languagecode="es"
            ;;
        turkish_1_2_2|turkish_1_2_2/|zipextracted/turkish_1_2_2/)
            newfilename="turkish_1_2_2.po"
            languagecode="tr"
            ;;
        ukrainian_1_2_3|ukrainian_1_2_3/|zipextracted/ukrainian_1_2_3/)
            newfilename="ukrainian_1_2_3.po"
            languagecode="uk"
            ;;
        # 3.2.1:
        estonian_eesti_keel_3_2_1_2017_10_19|estonian_eesti_keel_3_2_1_2017_10_19/|zipextracted/estonian_eesti_keel_3_2_1_2017_10_19/)
            newfilename="estonian_eesti_keel_3_2_1_2017_10_19.po"
            languagecode="et"
            ;;
        finnish_3_2_1_1|finnish_3_2_1_1/|zipextracted/finnish_3_2_1_1/)
            newfilename="finnish_3_2_1_1.po"
            languagecode="fi"
            ;;
        hebrew_3_2_1|hebrew_3_2_1/|zipextracted/hebrew_3_2_1/)
            newfilename="hebrew_3_2_1.po"
            languagecode="he"
            ;;
        italian_3_1_0|italian_3_1_0/|zipextracted/italian_3_1_0/)
            newfilename="italian_3_1_0.po"
            languagecode="it"
            ;;
        portuguese_português_3_1_0|portuguese_português_3_1_0/|zipextracted/portuguese_português_3_1_0/)
            newfilename="portuguese_português_3_1_0.po"
            languagecode="pt_preao"
            ;;
        # 3.2.0:
        czech_1_9|czech_1_9/|zipextracted/czech_1_9/)
            newfilename="czech_1_9.po"
            languagecode="cs"
            ;;
        *)
            newfilename="unknown.po"
            languagecode="unknown"
            ;;
      esac
      ;;
    c)
      echo "Deleting temporary folders... "
      if [ -e temp/ ]
      then
          rm -fr temp/
      fi
      if [ -e zip/ ]
      then
          rm -fr zip/
      fi
      if [ -e zipextracted/ ]
      then
          rm -fr zipextracted/
      fi
      if [ -e po/ ]
      then
          rm -fr po/
      fi
      echo "Done"
      exit 1
      ;;
    v)
      echo "PO converter 4"
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
    h | *)
      usage
      exit 1
      ;;
  esac
done



writetooutputboth() {

# Add this code to the bottom of the file (it echos $lang the way we want):
cat <<OUTPUT >> temp/output.php

\$poheader = '';
\$potext = '';
\$potextarray = array();

\$poheader .= '# Strings extracted from phpBB language pack php files
# Source: $languageinenglisha
# Translation: $languageinenglishb
# This file was converted from PHP to PO with phpBB PO converter:
# https://github.com/scootergrisen/phpbbpo
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

// Fix the strings so they can be in msgid "" and msgstr "" without " and newline causing problems
// so " have to be escaped
// TODO: note \" must not become \\" because then " is still not escaped
// some strings have \" already.
// the php files use: 'KEY' => 'Text "text".'

// NOTE: This is double escaped inside the shell script so good luck figuring out the real value
\$replace_from = array('\\\\', '"', "\\n");
\$replace_to = array('\\\\\\\\', '\\"', "\\\n");

//echo "lang_a\n";
//print_r(\$lang_a);
//echo "lang_b\n";
//print_r(\$lang_b);

foreach (\$lang_a as \$keya => \$valuea) {

    if (!is_array(\$valuea)) {

        \$lang_a[\$keya] = str_replace(\$replace_from, \$replace_to, \$valuea);

    } else {

       foreach (\$valuea as \$keyb => \$valueb) {

           if (!is_array(\$valueb)) {

               \$lang_a[\$keya][\$keyb] = str_replace(\$replace_from, \$replace_to, \$valueb);

           } else {

               foreach (\$valueb as \$keyc => \$valuec) {

                   if (!is_array(\$valuec)) {

                       \$lang_a[\$keya][\$keyb][\$keyc] = str_replace(\$replace_from, \$replace_to, \$valuec);

                   }

               }

           }

        }

    }

}

foreach (\$lang_b as \$keya => \$valuea) {

    if (!is_array(\$valuea)) {

        \$lang_b[\$keya] = str_replace(\$replace_from, \$replace_to, \$valuea);

    } else {

       foreach (\$valuea as \$keyb => \$valueb) {

           if (!is_array(\$valueb)) {

               \$lang_b[\$keya][\$keyb] = str_replace(\$replace_from, \$replace_to, \$valueb);

           } else {

               foreach (\$valueb as \$keyc => \$valuec) {

                   if (!is_array(\$valuec)) {

                       \$lang_b[\$keya][\$keyb][\$keyc] = str_replace(\$replace_from, \$replace_to, \$valuec);

                   }

               }

           }

        }

    }

}

function sayarray(\$header, \$array) {

    \$potext = '';

    \$potext .= \$header;

    foreach (\$array as \$piece) {

        // avoid some msgfmt complaints
        if (\$piece["comment"] != 'PRUNE_FINISHED_POLLS_EXPLAIN' &&
            \$piece["comment"] != 'FAIL_SEND_STATISTICS' &&
            \$piece["comment"] != 'ACP_PERMISSIONS_EXPLAIN' &&
            \$piece["comment"] != 'DEFAULT_INSTALL_POST' &&
            \$piece["comment"] != 'UPDATE_INSTRUCTIONS') {

                \$potext .= '#. ' . \$piece["comment"] . "\n";
                \$potext .= 'msgctxt "' . \$piece["msgctxt"] . '"' . "\n";
                \$potext .= 'msgid "' . \$piece["msgid"] . '"' . "\n";
                \$potext .= 'msgstr "' . \$piece["msgstr"] . '"' . "\n";
                \$potext .= "\n";

        }

    }

    \$potext = rtrim(\$potext) . "\n"; // bad fix to remove one of the newlines at the end

    echo \$potext;

}

function checkarray(\$a, \$b) {

    \$return_a = array_diff_key(\$a, \$b);
    \$return_b = array_diff_key(\$b, \$a);

    if (\$return_a) {

        return "Difference in array key";

    }

    if (\$return_b) {

        return "Difference in array key";

    }

}

foreach (\$lang_a as \$keya => \$valuea) {

\$comment = '';
\$msgctxt = '';
\$msgid = '';
\$msgstr = '';

    if (\$keya == "dateformats" || \$keya == "TRANSLATION_INFO") {

        // key dateformats uses different key for source and translation so skip it
        // skip at the moment (fix later)

    } else {

        if (!is_array(\$valuea)) {

            // Avoid a few empty strings that podiff would otherwise complain about
            if (\$keya != '' && \$valuea != '') {

                \$comment = 'Strings from \$lang array key [' . \$keya . ']';
                \$msgctxt = '[' . \$keya . ']';
                \$msgid = \$lang_a[\$keya];
                \$msgstr = \$lang_b[\$keya]; // some strings gives "Undefined index"

                \$potextarray[] = array(
                    "comment" => \$comment,
                    "msgctxt" => \$msgctxt,
                    "msgid"   => \$msgid,
                    "msgstr"  => \$msgstr
                );

            }

        } else {

            checkarray(\$lang_a[\$keya], \$lang_b[\$keya]);

            foreach (\$valuea as \$keyb => \$valueb) {

                if (!is_array(\$valueb)) {

                    // used by keys "timezones" and the onces with 0 1 2...

                    \$comment = 'Strings from \$lang array key [' . \$keya . ']['. \$keyb . ']';
                    \$msgctxt = '[' . \$keya . '][' . \$keyb . ']';
                    \$msgid = \$lang_a[\$keya][\$keyb];
                    //\$msgstr = \$lang_b[\$keya][\$keyb]; // some languages gives "Undefined offset" if 0 1 2 etc does not match in source and translation

                    (array_key_exists(\$keyb, \$lang_a[\$keya]))
                        ? \$msgstr = \$lang_a[\$keya][\$keyb]
                        : \$msgstr = '[MISSING FROM SOURCE PHP FILE]';

                    (array_key_exists(\$keyb, \$lang_b[\$keya]))
                        ? \$msgstr = \$lang_b[\$keya][\$keyb]
                        : \$msgstr = '[MISSING FROM TRANSLATION PHP FILE]';

                    \$potextarray[] = array(
                        "comment" => \$comment,
                        "msgctxt" => \$msgctxt,
                        "msgid"   => \$msgid,
                        "msgstr"  => \$msgstr
                    );

                } else {

                    checkarray(\$lang_a[\$keya][\$keyb], \$lang_b[\$keya][\$keyb]);

                    foreach (\$valueb as \$keyc => \$valuec) {

                        if (!is_array(\$valuec)) {

                            // only used by keys "datetime", "report_reasons"

                            \$comment = 'Strings from \$lang array key [' . \$keya . '][' . \$keyb . ']['. \$keyc . ']';
                            \$msgctxt = '[' . \$keya . '][' . \$keyb . '][' . \$keyc . ']';
                            \$msgid = \$lang_a[\$keya][\$keyb][\$keyc];
                            //\$msgstr = \$lang_b[\$keya][\$keyb][\$keyc]; // some languages gives "Undefined offset" if 0 1 2 etc does not match in source and translation

                    (array_key_exists(\$keyc, \$lang_a[\$keya][\$keyb]))
                        ? \$msgstr = \$lang_a[\$keya][\$keyb][\$keyc]
                        : \$msgstr = '[MISSING FROM SOURCE PHP FILE]';

                    (array_key_exists(\$keyc, \$lang_b[\$keya][\$keyb]))
                        ? \$msgstr = \$lang_b[\$keya][\$keyb][\$keyc]
                        : \$msgstr = '[MISSING FROM TRANSLATION PHP FILE]';

                            \$potextarray[] = array(
                                "comment" => \$comment,
                                "msgctxt" => \$msgctxt,
                                "msgid"   => \$msgid,
                                "msgstr"  => \$msgstr
                            );

                        } else {

                            echo "\$lang is deep";

                            // this part is properly never used because the \$lang array never goes this deep
                            //foreach (\$valuec as \$keyd => \$valued) {
                            //
                            //    \$comment = 'Strings from \$lang array key [' . \$keya . '][' . \$keyb . ']['. \$keyc . ']['. \$keyd . ']';
                            //    \$msgctxt = '[' . \$keya . '][' . \$keyb . '][' . \$keyc . '][' . \$keyd . ']';
                            //    \$msgid = \$lang_a[\$keya][\$keyb][\$keyc][\$keyd];
                            //    \$msgstr = \$lang_b[\$keya][\$keyb][\$keyc][\$keyd];
                            //
                            //    \$potextarray[] = array(
                            //        "comment" => \$comment,
                            //        "msgctxt" => \$msgctxt,
                            //        "msgid"   => \$msgid,
                            //        "msgstr"  => \$msgstr
                            //    );
                            //
                            //}

                        }

                    }

                }

            }

        }

    }

}

sayarray(\$poheader, \$potextarray);
OUTPUT

}



if [ -e temp/output.a.php ] && [ -e temp/output.b.php ] && [ -e temp/output.php ]
then

    # Change $lang to $lang_a and $lang_b
    sed -i -e 's/$lang/$lang_a/g' temp/output.a.php
    sed -i -e 's/$lang/$lang_b/g' temp/output.b.php

    # Remove all the "<?php" (we only need one at the beginning of the file):
    sed -i -e 's/<?php//g' temp/output.a.php
    sed -i -e 's/<?php//g' temp/output.b.php

    # Gather the files into one file
    cat temp/output.a.php >> temp/output.php;
    cat temp/output.b.php >> temp/output.php;

    # Add "<?php" to the beginning of the file and enable error messages in case something goes wrong:
    sed -i '1s/^/ini_set("display_errors", "On");\n/' temp/output.php
    sed -i '1s/^/ini_set("display_startup_errors", "On");\n/' temp/output.php
    sed -i '1s/^/ini_set("error_reporting", -1);\n/' temp/output.php
    sed -i '1s/^/define("IN_PHPBB", true);\n/' temp/output.php
    sed -i '1s/^/<?php\n/' temp/output.php

    writetooutputboth

fi



# Create the PO file
if [ -v newfilename ] && [ -v languageinenglisha ]
then
    php temp/output.php > po/$newfilename
    #echo "Created po/$newfilename: $languageinenglisha <=> $languageinenglishb [$languagecode]";
    echo "po/$newfilename was created";
fi
