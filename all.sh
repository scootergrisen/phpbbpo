#!/bin/bash



# Download, extract and converter some translations for phpBB
#
#
# Version: 4
# Author: scootergrisen (https://www.phpbb.com/community/memberlist.php?mode=viewprofile&u=1329459)
# Year: 2018
# License: GNU GPL 3 (https://www.gnu.org/licenses/)
# Code: https://github.com/scootergrisen/phpbbpo



echo "This will happen:"
echo "Download some language packs from phpbb.com (zip/)"
echo "Extract zip files (zipextracted/)"
echo "Convert php files to PO format (po/)"
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
    echo "Downloading zip files..."
    # Download language packs
# 3.2.2:
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
# 3.2.1:
    if ! [ -e zip/british_english_3_2_1.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/british_english_3_2_1.zip" -C - https://www.phpbb.com/customise/db/download/145721
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/estonian_eesti_keel_3_2_1_2017_10_19.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/estonian_eesti_keel_3_2_1_2017_10_19.zip" -C - https://www.phpbb.com/customise/db/download/150191
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/finnish_3_2_1_1.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/finnish_3_2_1_1.zip" -C - https://www.phpbb.com/customise/db/download/149231
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/hebrew_3_2_1.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/hebrew_3_2_1.zip" -C - https://www.phpbb.com/customise/db/download/151981
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/italian_3_1_0.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/italian_3_1_0.zip" -C - https://www.phpbb.com/customise/db/download/149051
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/portuguese_português_3_1_0.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/portuguese_português_3_1_0.zip" -C - https://www.phpbb.com/customise/db/download/146101
    else
        echo -e "●\c"
    fi
# 3.2.0:
    if ! [ -e zip/british_english_3_2_0.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/british_english_3_2_0.zip" -C - https://www.phpbb.com/customise/db/download/134676
    else
        echo -e "●\c"
    fi
    if ! [ -e zip/czech_1_9.zip ]
    then
        echo -e "↓\c"
        curl --progress-bar -s -o "zip/czech_1_9.zip" -C - https://www.phpbb.com/customise/db/download/135641
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
        echo "Extracting zip files..."
        # Extract all the language pack zip files
        #unzip -o zip/*.zip -d zipextracted/
        for f in $(find zip/ -name "*.zip"); do unzip -qo $f -d zipextracted/; echo -e "●\c"; done
        echo ""
    fi

fi



if [ -e po/ ]
then
    echo "Creating PO files..."
# 3.2.2:
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
# 3.2.1:
    ./po.sh -a zipextracted/british_english_3_2_1/ -b zipextracted/estonian_eesti_keel_3_2_1_2017_10_19/
    ./po.sh -a zipextracted/british_english_3_2_1/ -b zipextracted/finnish_3_2_1_1/
    ./po.sh -a zipextracted/british_english_3_2_1/ -b zipextracted/hebrew_3_2_1/
    ./po.sh -a zipextracted/british_english_3_2_1/ -b zipextracted/italian_3_1_0/
    ./po.sh -a zipextracted/british_english_3_2_1/ -b zipextracted/portuguese_português_3_1_0/
# 3.2.0:
    ./po.sh -a zipextracted/british_english_3_2_0/ -b zipextracted/czech_1_9/
fi



echo "Done"
