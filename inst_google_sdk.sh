#!/bin/bash
################################## 
#
#  Script:    inst_google_sw.sh
#  Purpose:   install the google sdk sw
#
#  Maintainer: Oren Teomi
#  Created:    01/04/2018
#  Modified:   01/04/2018
#  Version:    1.1
#
##################################
LOGF="/tmp/logs/inst_google_sdk.log"
function install_google_sw {
   echo "Installing Google SW"| tee -a $LOGF
   export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
   echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main"|sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
   curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
   if [ $? -eq 0 ]
   then
     echo "Downloaded gpg key for Google-cloud-sdk"|tee -a $LOGF
     sudo apt-get update && sudo apt-get install google-cloud-sdk
     if [ $? -eq 0 ]
     then
        echo "Successfully installed Google-cloud-sdk SW"|tee -a $LOGF
     else
        echo "Error:Failed to install Google-cloud-sdk SW"|tee -a $LOGF
     fi
   else
     echo "Error:Failed to download gpg key for Google-cloud-sdk"|tee -a $LOGF
     echo "      aborting Google-cloud-sdk installation"|tee -a $LOGF
   fi
}
install_google_sw
