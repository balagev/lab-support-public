#Install LXDE lxde.org and xrdp - (make sure to open 3389 on the NSG of the azure vm)
apt-get update
apt-get install lxde -y
apt-get install xrdp -y
/etc/init.d/xrdp start

#installing visual studio code which can be launched from accessories
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/x86_64-linux-gnu/libxcb.so.1
apt-get update
apt-get install code

#Prepare XWindows System
wget https://opsgilityweb.blob.core.windows.net/test/xsession
mv xsession /home/demouser/.xsession

#install the Azure CLI using instructions from Azure.com
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
     sudo tee /etc/apt/sources.list.d/azure-cli.list
apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
apt-get install apt-transport-https -y
apt-get update && sudo apt-get install azure-cli -y

#install docker
#to run the az cli container open terminal and use 'sudo docker run -it azuresdk/azure-cli-python:latest'
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
apt-get update
apt-get install -y docker-ce