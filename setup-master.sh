multipass launch --name master --memory 3G --cpus 2 --disk 50G
multipass exec master -- sudo snap install microk8s --classic
multipass exec master -- sudo iptables -P FORWARD ACCEPT
echo 'Exec this then exit and shell again'
echo 'sudo usermod -aG microk8s ubuntu'
read x
multipass shell master
multipass shell master
