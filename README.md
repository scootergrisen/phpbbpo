## phpBB PO Converter
# These shell scripts can extract the strings from the php files in language packs and create a single PO file.

The PO file can be used to check for errors in lots of tools like:  
gettext https://www.gnu.org/software/gettext/  
PyG3T https://github.com/pyg3t/pyg3t  
Translate Toolkit http://toolkit.translatehouse.org/  
GUI:  
Virtaal http://virtaal.translatehouse.org/  
Poedit https://poedit.net/  
Qt Linguist https://doc.qt.io/qt-5/linguist-translators.html  

## po.sh
# Creates a output.po file.

Usage:

    ./po.sh -a <first folder> -b <second folder>
    
    <first folder> can be the folder where the source language pack zip file was extracted to (like "british_english_3_2_2")
    <second folder> can be the folder where the translated language pack zip file was extracted to (like "danish_3_2_2")

Example:

    ./po.sh -a british_english_3_2_2 -b danish_3_2_2

## all.sh
# Downloads 25 language pack zip files (those that are updated to phpBB 3.2.2), extracts them and uses po.sh to create po files from all of them.

Example:

    ./all.sh

The scripts uses curl, unzip, sed, php so i guess lots of things can go wrong and im not good at writing shell scripts so feel free to help improve the code.
