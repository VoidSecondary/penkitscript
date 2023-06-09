#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[*] Bug Bounty Toolkit Installer${NC}"
echo -e "${GREEN}[*] Setting Up Directories${NC}"

cd $HOME
mkdir toolkit
mkdir ~/toolkit/wordlists

echo -e "${GREEN}[*] Installing Essentials${NC}"
apt-get update
apt-get install -y build-essential
apt-get install -y gcc 
apt-get install -y git
apt-get install -y vim 
apt-get install -y wget 
apt-get install -y curl
apt-get install -y awscli
apt-get install -y inetutils-ping 
apt-get install -y make 
apt-get install -y nmap 
apt-get install -y whois 
apt-get install -y python3
apt-get install -y python-pip 
apt-get install -y python-is-python3
apt-get install -y perl 
apt-get install -y nikto
apt-get install -y dnsutils 
apt-get install -y net-tools
apt-get install -y zsh
apt-get install -y nano
apt-get install -y tmux
echo -e "${GREEN}[*] Essentials installed${NC}"

# Install Go
read -p "Do you want to install Go? or do you already have it? y/n" -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "${BLUE}[*] Installing Go"
    cd ~
    curl -OL https://go.dev/dl/go1.20.5.linux-amd64.tar.gz
    sudo tar -C /usr/local -xvf go1.20.5.linux-amd64.tar.gz
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    export PATH=$PATH:/usr/local/go/bin
    source ~/.bashrc
    rm go1.20.5.linux-amd64.tar.gz
    sleep 3
    go version
    echo -e "${BLUE}[*] Go installation is done"
    sleep 3
fi

# Nmap
echo -e "${GREEN}[*] Installing Nmap${NC}"
apt-get install -y nmap

# massdns
echo -e "${GREEN}[*] Installing massdns${NC}"
apt-get install -y libldns-dev
cd ~/toolkit 
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
ln -sf ~/toolkit/massdns/bin/massdns /usr/local/bin/massdns

# shuffledns
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
ln -sf ~/go/bin/shuffledns /usr/local/bin/shuffledns

# Nuclei
echo -e "${GREEN}[*] Installing Nuclei"
cd ~/toolkit
mkdir Nuclei
cd Nuclei
git clone https://github.com/projectdiscovery/nuclei.git
cd nuclei/v2/cmd/nuclei
go build
mv nuclei /usr/local/bin/

# Trufflehog
echo -e "${GREEN}[*] Installing TruffleHog"
cd ~/toolkit
git clone https://github.com/trufflesecurity/trufflehog.git
cd trufflehog
go install
ln -sf ~/go/bin/trufflehog /usr/local/bin/trufflehog

# waybackurls
echo -e "${GREEN}[*] Installing waybackurls"
cd ~/toolkit
go install github.com/tomnomnom/waybackurls@latest
ln -sf ~/go/bin/waybackurls /usr/local/bin/waybackurls

# waymore
echo -e "${GREEN}[*] Installing waymore$ ${NC}"
cd ~/toolkit
git clone https://github.com/xnl-h4ck3r/waymore.git
cd waymore
pip3 install -r requirements.txt
python setup.py install
ln -sf ~/toolkit/waymore/waymore.py /usr/local/bin/waymore

# Surf by assetnote
echo -e "${GREEN}[*] Installing surf by assetnote ${NC}"
go install github.com/assetnote/surf/cmd/surf@latest
ln -sf ~/go/bin/surf /usr/local/bin/surf

# xnLinkfinder
echo -e "${GREEN}[*] Installing xnLinkfinder by xnl-h4ck3r${NC}"
cd ~/toolkit
git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git
cd xnLinkFinder
python setup.py install
ln -sf ~/toolkit/xnLinkFinder/xnLinkFinder.py /usr/local/bin/xnlinkfinder

# FeroxBuster
echo -e "${GREEN}[*] Installing FeroxBuster${NC}"
cd ~/toolkit
mkdir FeroxBuster
cd FeroxBuster
curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/master/install-nix.sh | bash

# thc-hydra
echo -e "${GREEN}[*] Installing thc-hydra${NC}"
apt-get install -y hydra

# Naabu
echo -e "${GREEN}[*] Installing Naabu${NC}"
apt install -y libpcap-dev
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
ln -sf ~/go/bin/naabu /usr/local/bin/naabu

# Sublist3r
echo -e "${GREEN}[*] Installing Sublist3r${NC}"
cd ~/toolkit 
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip install -r requirements.txt
ln -sf ~/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# knock
echo -e "${GREEN}[*] Installing Knockpy${NC}"
apt-get install -y python-dnspython 
cd ~/toolkit
git clone https://github.com/guelfoweb/knock.git
cd knock
pip3 install -r requirements.txt
chmod +x setup.py
python3 setup.py install

# dirb
echo -e "${GREEN}[*] Installing dirb${NC}"
apt-get install -y dirb

# Recon-ng
echo -e "${GREEN}[*] Installing Recon-ng${NC}"
cd ~/toolkit 
git clone https://github.com/lanmaster53/recon-ng.git 
cd recon-ng 
apt-get install -y python3-pip 
pip3 install -r REQUIREMENTS 
chmod +x recon-ng 
ln -sf ~/toolkit/recon-ng/recon-ng /usr/local/bin/recon-ng

# XSStrike
echo -e "${GREEN}[*] Installing XSStrike${NC}"
cd ~/toolkit
git clone https://github.com/s0md3v/XSStrike.git 
cd XSStrike 
apt-get install -y python3-pip 
pip3 install -r requirements.txt 
chmod +x xsstrike.py
ln -sf ~/toolkit/XSStrike/xsstrike.py /usr/local/bin/xsstrike

# sqlmap
echo -e "${GREEN}[*] Installing sqlmap${NC}"
apt-get install -y sqlmap

# SSRFmap
echo -e "${GREEN}[*] Installing SSRFmap${NC}"
cd ~/toolkit
git clone https://github.com/swisskyrepo/SSRFmap
cd SSRFmap
pip3 install -r requirements.txt
ln -sf ~/toolkit/SSRFmap/ssrfmap.py /usr/local/bin/ssrfmap

# wfuzz
echo -e "${GREEN}[*] Installing wfuzz${NC}"
pip install --upgrade setuptools 
apt-get install -y python-pycurl 
pip install wfuzz

# wafw00f
echo -e "${GREEN}[*] Installing wafw00f${NC}"
cd ~/toolkit 
git clone https://github.com/enablesecurity/wafw00f.git 
cd wafw00f 
chmod +x setup.py 
python3 setup.py install

# wpscan
echo -e "${GREEN}[*] Installing wpscan${NC}"
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev 
cd ~/toolkit 
git clone https://github.com/wpscanteam/wpscan.git 
cd wpscan/ 
gem install bundler && bundle install --without test 
gem install wpscan

# dnsgen
echo -e "${GREEN}[*] Installing dnsgen${NC}"
cd ~/toolkit
git clone https://github.com/ProjectAnte/dnsgen
cd dnsgen
pip3 install -r requirements.txt
python3 setup.py install

# Assetfinder
echo -e "${GREEN}[*] Installing assetfinder${NC}"
cd ~/toolkit 
go install github.com/tomnomnom/assetfinder@latest
ln -sf ~/go/bin/assetfinder /usr/local/bin/assetfinder


# dirsearch
echo -e "${GREEN}[*] Installing dirsearch${NC}"
cd ~/toolkit 
git clone https://github.com/maurosoria/dirsearch.git --depth 1
cd dirsearch
pip install -r requirements.txt
chmod +x dirsearch.py 
ln -sf ~/toolkit/dirsearch/dirsearch.py /usr/local/bin/dirsearch

# gobuster
echo -e "${GREEN}[*] Installing gobuster${NC}"
go install -v github.com/OJ/gobuster/v3@latest
ln -sf ~/go/bin/gobuster /usr/local/bin/gobuster

# s3recon
echo -e "${GREEN}[*] Installing s3recon${NC}"
apt-get install -y python3-pip
pip3 install setuptools pyyaml pymongo requests s3recon

# KXSS by EMOE
go install -v github.com/Emoe/kxss@latest
ln -sf ~/go/bin/kxss /usr/local/bin/kxss

# Katana by ProjectDiscovery
echo -e "${GREEN} Installing Katana by ProjectDiscovery ${NC}"
apt update
snap refresh
apt install zip curl wget git
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt update
apt install google-chrome-stable
go install github.com/projectdiscovery/katana/cmd/katana@latest
ln -sf ~/go/bin/katana /usr/local/bin/katana

# gau by lc
echo -e "${GREEN} Installing gau by lc${NC}"
go install github.com/lc/gau/v2/cmd/gau@latest
ln -sf ~/go/bin/gau /usr/local/bin/gau

# subfinder
echo -e "${GREEN}[*] Installing subfinder${NC}"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
ln -sf ~/go/bin/subfinder /usr/local/bin/subfinder

# httpx
echo -e "${GREEN}[*] Installing httpx ${NC}"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
ln -sf ~/go/bin/httpx /usr/local/bin/httpx

# interactsh
echo -e "${GREEN}[*] Installing interactsh by project discovery${NC}"
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
ln -sf ~/go/bin/interactsh-client /usr/local/bin/interactsh-client

# Notify by projectdiscovery
echo -e "${GREEN}[*] Installing notify by project discovery${NC}"
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
ln -sf ~/go/bin/notify /usr/local/bin/notify

# tlsx by project discovery
echo -e "${GREEN}[*] Installing tlsx by project discovery${NC}"
go install github.com/projectdiscovery/tlsx/cmd/tlsx@latest
ln -sf ~/go/bin/tlsx /usr/local/bin/tlsx

# fierce
echo -e "${GREEN}[*] Installing fierce${NC}"
python3 -m pip install fierce

# amass
echo -e "${GREEN}[*] Installing amass${NC}"
export GO111MODULE=on
go install -v github.com/owasp-amass/amass/v3/...@master
ln -sf ~/go/bin/amass /usr/local/bin/amass

# ffuf
echo -e "${GREEN}[*] Installing ffuf${NC}"
go install github.com/ffuf/ffuf/v2@latest
ln -sf ~/go/bin/ffuf /usr/local/bin/ffuf

# SecLists
read -p "Do you want to download SecLists? y/n " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "${GREEN}[*] Downloading SecLists${NC}"
    cd ~/toolkit/wordlists
    git clone https://github.com/danielmiessler/SecLists.git
fi

# OneListForAll
read -p "Do you want to download OneListForAll by six2dez? y/n" -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -e "${GREEN}[*] Downloading OneListForAll${NC}"
	cd ~/toolkit/wordlists
	git clone https://github.com/six2dez/OneListForAll.git
fi

# PayloadsAllTheThings
read -p "Do you want to download PayloadsAllTheThings by swisskyrepo? y/n" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -e "${GREEN}[*] Downloading PayloadsAllTheThings${NC}"
	cd ~/toolkit/wordlists
	git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
fi

# Cleanup
echo -e "${GREEN}[*] Tidying up${NC}"
apt-get clean

echo -e "${GREEN}[*] Installation Complete! ${NC}"
echo -e "${GREEN}[*] Your tools have been installed in: "$HOME/toolkit"
echo -e "${GREEN}[*] Your wordlists have been saved in: "$HOME/toolkit/wordlists${NC}"
