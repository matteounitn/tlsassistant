#!/bin/bash

## echo functions definition (https://stackoverflow.com/a/42449998/3370955)
function r_echo {
    echo -e '\033[7m'$1'\033[0m'
}
function b_echo {
    echo -e '\033[1m'$1'\033[0m'
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR #moving to the right path

b_echo "################"
b_echo "# TLSAssistant #"
b_echo "################"
echo ""
r_echo "# Installing dependencies..."
sudo apt-get install -y aha html2text libxml2-utils git curl wget
echo ""
r_echo "Utilities installed"
sudo apt-get install -y python python-pip
echo ""
r_echo "Python installed"
pip install -U androguard
r_echo "Androguard installed"
pip install -U --pre tlslite-ng
r_echo "TLS Lite installed"
echo ""
mkdir utility
curl -s https://raw.githubusercontent.com/chadbraunduin/markdown.bash/master/markdown.sh > utility/markdown.sh
r_echo "TLS Lite installed"
echo ""

r_echo "# Installing tools..."
echo ""
r_echo "## Downloading mallodroid..."
git clone https://github.com/luckenzo/mallodroid.git ./Analyzer/tools/others/mallodroid > /dev/null 2>&1
b_echo "Done"

echo ""
r_echo "## Downloading TLS Extended_Master_Checker..."
git clone https://github.com/Tripwire-VERT/TLS_Extended_Master_Checker.git ./Analyzer/tools/server/TLS_Extended_Master_Checker > /dev/null 2>&1
b_echo "Done"

echo ""
r_echo "## Downloading tlsfuzzer..."
git clone https://github.com/tomato42/tlsfuzzer.git ./Analyzer/tools/server/tlsfuzzer > /dev/null 2>&1
b_echo "Done"

echo ""
r_echo "## Downloading testssl.sh..."
wget --no-check-certificate -N https://github.com/drwetter/testssl.sh/archive/3.0rc5.zip > /dev/null 2>&1
unzip -o 3.0rc5.zip -d ./Analyzer/tools/server > /dev/null 2>&1
rm 3.0rc5.zip
b_echo "Done"

echo ""
b_echo "Installation completed successfully!"
echo ""