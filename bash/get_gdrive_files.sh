#!/bin/bash

# This script downloads a file from Google Drive
# Obtained from: https://stackoverflow.com/questions/25010369/wget-curl-large-file-from-google-drive/49444877#49444877
#
# To determine fileid:
#  Right-click on the file you want to download, click get sharable link
#  Paste the link. It should be in this format:
#   https://drive.google.com/file/d/FILEIDENTIFIER/view?usp=sharing
#  Copy the FILEIDENTIFIER portion from the link.
#
# You can provide any name for filename

------------
 2015 file
------------
fileid="1mZ9lxc5yYZahVzHuICuN4_fMMxF81mRa"
filename="FINN_daily_2015_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2014 file
#------------
fileid="10EzfKrXUp3M8X1Z3hlrw5SR8jNK5Pqak"
filename="FINN_daily_2014_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2013 file
#------------
fileid="1ayml5TS7UZCW9z6-mpcpuj--tRj6iKec"
filename="FINN_daily_2013_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2012 file
#------------
fileid="1_1vWOgzU3yIiqqevUhDQK5Uc2HCas4LD"
filename="FINN_daily_2012_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2011 file
#------------
fileid="1-5B8ORkg8ukFkilzrNox4xfLtZg9kmOM"
filename="FINN_daily_2011_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2010 file
#------------
fileid="185J7qr75Y4UiniaTlvNs8KayUWtO3x3P"
filename="FINN_daily_2010_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2009 file
#------------
fileid="1h527oO2sfWx4IsDLtJC5sj7npWRSAthM"
filename="FINN_daily_2009_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2008 file
#------------
fileid="1adHuvNk_VcXUdteOUpp4fLl55qbX6W4i"
filename="FINN_daily_2008_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2007 file
#------------
fileid="1EI_OpkfCVLJAUPSGVTP6_4ZDG3s2ToZz"
filename="FINN_daily_2007_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2006 file
#------------
fileid="17NwoETkbAFXs2ZkDUP4Oy8QjgWL7v9qa"
filename="FINN_daily_2006_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2005 file
#------------
fileid="18wyFfIcBFRItPeBPs6zQetWoIoILM5cJ"
filename="FINN_daily_2005_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2004 file
#------------
fileid="1NgCeMSUhaOoymZ4QnRa-wBp7ACO5jWRH"
filename="FINN_daily_2004_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2003 file
#------------
fileid="1opdgyOgG9AFLQI7BRseVXHrPbMQQ9-AU"
filename="FINN_daily_2003_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie

#------------
# 2002 file
#------------
fileid="1TWR3E5bF9MlihymBsL7MjLdk4ZrZ0EmM"
filename="FINN_daily_2002_0.25x0.25_with_num.nc"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf cookie
