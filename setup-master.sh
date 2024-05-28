multipass launch --name master --memory 3G --cpus 2 --disk 50G
multipass exec master -- sudo snap install microk8s --classic
multipass exec master -- sudo iptables -P FORWARD ACCEPT
echo 'Exec this then exit and shell again'
multipass exec master -- sudo usermod -aG microk8s ubuntu
multipass exec master -- sudo chown -f -R ubuntu ~/.kube
multipass exec master -- echo "alias kubectl='microk8s kubectl'" > ~/.bash_alias
multipass exec master -- echo "alias k2='microk8s kubectl'" > ~/.bash_alias
multipass shell master
