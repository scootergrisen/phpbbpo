#!/bin/bash



# Download, extract and converter all translations for phpBB 3.2.2
# Uses: curl, unzip
#
# Version: 3
# Author: scootergrisen (https://www.phpbb.com/community/memberlist.php?mode=viewprofile&u=1329459)
# Year: 2018
# License: GNU GPL 3



echo "Downloads all language packs (that have translation for phpBB 3.2.2) (zip/)"
echo "Extracts zip files (zipextracted/)"
echo "Converts the php files to PO format (po/)"
echo ""



# Create dir for temporary files
if ! [ -e temp/ ]
then
    mkdir temp/
fi



# Create dir for language pack zip files
if ! [ -e zip/ ]
then
    mkdir zip/
fi



# Create dir for uxtracted zip files
if ! [ -e zipextracted/ ]
then
    mkdir zipextracted/
fi



# Create dir for PO files
if ! [ -e po/ ]
then
    mkdir po/
fi



if [ -e zip/ ]
then
    echo -e "Downloading zip files... \c"
    # Download language packs (all the onces that have a translation for phpBB 3.2.2)
    if ! [ -e zip/american_english_3_2_0.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/american_english_3_2_0.zip" -C - https://www.phpbb.com/customise/db/download/153491
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/arabic_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/arabic_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152731
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/brazilian_portuguese_1_3_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/brazilian_portuguese_1_3_2.zip" -C - https://www.phpbb.com/customise/db/download/152536
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/british_english_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/british_english_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152656
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/catalan_2_1_3.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/catalan_2_1_3.zip" -C - https://www.phpbb.com/customise/db/download/153176
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/croatian_casual_honorifics_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/croatian_casual_honorifics_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152856
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/croatian_formal_honorifics_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/croatian_formal_honorifics_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152861
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/danish_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/danish_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/153311
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/dutch_casual_honorifics_2_1_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/dutch_casual_honorifics_2_1_2.zip" -C - https://www.phpbb.com/customise/db/download/152736
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/french_3_2_0.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/french_3_2_0.zip" -C - https://www.phpbb.com/customise/db/download/152521
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/gaelic_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/gaelic_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/155771
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/german_casual_honorifics_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/german_casual_honorifics_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152921
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/german_formal_honorifics_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/german_formal_honorifics_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152991
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/greek_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/greek_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152821
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/mandarin_chinese_simplified_script_18_03_0.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/mandarin_chinese_simplified_script_18_03_0.zip" -C - https://www.phpbb.com/customise/db/download/154601
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/mandarin_chinese_traditional_script_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/mandarin_chinese_traditional_script_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152746
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/persian_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/persian_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152556
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/polish_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/polish_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/153096
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/portuguese_3_1_1.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/portuguese_3_1_1.zip" -C - https://www.phpbb.com/customise/db/download/155781
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/russian_2_0_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/russian_2_0_2.zip" -C - https://www.phpbb.com/customise/db/download/152541
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/slovak_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/slovak_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152546
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/spanish_casual_honorifics_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/spanish_casual_honorifics_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152581
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/spanish_formal_honorifics_3_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/spanish_formal_honorifics_3_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152586
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/turkish_1_2_2.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/turkish_1_2_2.zip" -C - https://www.phpbb.com/customise/db/download/152646
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/ukrainian_1_2_3.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/ukrainian_1_2_3.zip" -C - https://www.phpbb.com/customise/db/download/154151
    else
        echo -e "●\c"
    fi
    echo ""

    # phpbb.com uses UTF-8 so seems this does not work i curl ("attachment; filename*=UTF-8''ukrainian_1_2_3.zip")
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/153491
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152731
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152536
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152656
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/153176
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152856
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152861
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/153311
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152736
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152521
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/155771
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152921
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152991
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152821
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/154601
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152746
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152556
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/153096
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/155781
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152541
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152546
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152581
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152586
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/152646
    #curl --verbose --remote-name --remote-header-name --location https://www.phpbb.com/customise/db/download/154151

    if [ -e zipextracted/ ]
    then
        echo -e "Extracting zip files...  \c"
        # Extract all the language pack zip files
        #unzip -o zip/*.zip -d zipextracted/
        for f in $(find zip/ -name "*.zip"); do unzip -qo $f -d zipextracted/; echo -e "●\c"; done
        echo ""
    fi

fi



if [ -e po/ ]
then
    echo -e "Creating PO files... \c"
    echo ""
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/american_english_3_2_0/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/arabic_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/brazilian_portuguese_1_3_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/british_english_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/catalan_2_1_3/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/croatian_casual_honorifics_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/croatian_formal_honorifics_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/danish_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/dutch_casual_honorifics_2_1_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/french_3_2_0/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/gaelic_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/german_casual_honorifics_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/german_formal_honorifics_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/greek_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/mandarin_chinese_simplified_script_18_03_0/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/mandarin_chinese_traditional_script_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/persian_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/polish_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/portuguese_3_1_1/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/russian_2_0_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/slovak_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/spanish_casual_honorifics_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/spanish_formal_honorifics_3_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/turkish_1_2_2/
    ./po.sh -a zipextracted/british_english_3_2_2/ -b zipextracted/ukrainian_1_2_3/
fi



echo "Done"
