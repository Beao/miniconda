sudo apt-get update
sudo apt-get upgrade

sudo apt-get install build-essential
sudo apt-get install git
sudo apt-get install python-pip
sudo apt-get install python-dev
sudo apt-get install libfreetype6-dev

sudo -H pip install --upgrade pip
sudo -H pip install six --upgrade
sudo -H pip install numpy
sudo -H pip install python-dateutil
sudo -H pip install matplotlib
sudo -H pip install pandas
sudo -H pip install pandas-datareader
sudo -H pip install empyrical

(http://mrjbq7.github.io/ta-lib/install.html)
cd ~/Downloads
sudo wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar -xzvf ta-lib-0.4.0-src.tar.gz
cd ta-lib
./configure --prefix=/usr
make
sudo make install
sudo -H pip install TA-Lib

#install jupyter notebook
sudo -H pip install jupyter

#if you want to run unit tests (optional)
sudo apt install python-tk

#install itable from github
mkdir ~/src
cd ~/src
git clone https://github.com/mgymrek/itable.git
cd itable
sudo python setup.py install

#install pinkfish from github
cd ~/src
git clone https://github.com/fja05680/pinkfish.git
cd pinkfish
sudo python setup.py install

#create/specify shared data cache directory (optional)
mkdir $HOME/data
echo [global] > $HOME/.pinkfish
echo base_dir = $HOME >> $HOME/.pinkfish
