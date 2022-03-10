#!/usr/bin/bash
# ec2_setup.sh
# Ariel Gutierrez

# install packages
sudo yum update -y
sudo yum install httpd -y
sudo yum install git -y

# a for ariel
mkdir /acode
cd /acode

sudo git clone --branch ariel https://github.com/arielmata/cpsc298_2022.git

# make things my name instead
sudo mv cpsc298_2022/wood cpsc298_2022/ariel
sudo sed -i 's/Wood/Ariel/g' cpsc298_2022/ariel/html/index.html 
sudo sed -i '/github/a\DATE' cpsc298_2022/ariel/html/index.html
sudo cp cpsc298_2022/ariel/html/index.html /var/www/html/index.html

# sed - write the date somewhere
export dat=`date`
sudo sed -i "s/DATE/${dat}/g" /var/www/html/index.html

sudo service httpd start
sudo chkconfig httpd on
