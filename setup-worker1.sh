multipass launch --name worker1 --memory 3G --cpus 2 --disk 10G
multipass exec worker1 -- sudo snap install microk8s --classic
multipass exec worker1 -- sudo iptables -P FORWARD ACCEPT
echo 'Exec this then exit and shell again'
echo 'sudo usermod -aG microk8s ubuntu'
read x
multipass shell worker1
multipass shell worker1
