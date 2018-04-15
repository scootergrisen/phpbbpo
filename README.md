## phpBB PO Converter
# These shell scripts can extract the strings from the php files in language packs and create a single PO file.

## Screenshot
# ![Screenshot of PO converter in terminal](screenshot1.png)

## Language packs

Can be found on [https://www.phpbb.com/languages/](phpbb.com] (also [https://www.phpbb.com/customise/db/language_packs-25](phpbb.com))
If you run the all.sh script it will download the language packs for you so you dont have to do it manually

## po.sh
# Creates a single PO file.

Run "./po.sh -h" for usage.

    Usage: ./po.sh [-a <first folder> -b <second folder>] [-c]
    Extracts strings from two phpBB language packs
    and combines the strings in a PO file.
    
    -a <folder>    Content of unpacked language pack zip file
                   (usually the source language which is british_english_[VERSION]
    -b <folder>    Content of unpacked language pack zip file
                   (usually the translation you work on e.g. danish_[VERSION]
                   Source and translation should be the same version
    -c             Delete the temporary files and folder
                   (temp/, zip/, zipextracted/, po/)
    -v             Version information

Example:

    ./po.sh -a british_english_3_2_2 -b danish_3_2_2

## all.sh
# Downloads 25 language pack zip files (those that are updated to phpBB 3.2.2), extracts them and uses po.sh to create PO files from all of them.

Example:

    ./all.sh

## checkpo.sh
# Checks the PO files created with all.sh

See what warning/error messages we can get.
This we can use to improve the code or the language packs so it will hopefully give zero warnings/errors in the future versions

## Tools
# Here are some tools that can be used to check for errors in PO files

[https://www.gnu.org/software/gettext/](gettext)  
[https://github.com/pyg3t/pyg3t](PyG3T)  
[Toolkit http://toolkit.translatehouse.org/](Translate)  
GUI tools:  
[http://virtaal.translatehouse.org/](Virtaal)  
[https://poedit.net/](Poedit)  
[https://doc.qt.io/qt-5/linguist-translators.html](Qt Linguist)  

## Permission to run files
# chmod

If you get "command not found" or "Permission denied" you might need to run these commands before you can execute the files
sudo chmod +x po.sh
sudo chmod +x all.sh

## End note
# The scripts uses curl, unzip, sed, php so i guess lots of things can go wrong and im not good at writing shell scripts so feel free to help improve the code.
