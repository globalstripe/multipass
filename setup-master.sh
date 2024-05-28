multipass launch --name master --memory 3G --cpus 2 --disk 50G
multipass exec master -- sudo snap install microk8s --classic
multipass exec master -- sudo iptables -P FORWARD ACCEPT
echo 'Exec this then exit and shell again'
multipass exec master -- sudo usermod -aG microk8s ubuntu
multipass exec master -- sudo chown -f -R ubuntu ~/.kube
multipass exec master -- bash -c 'microks8 enable dashboard'
multipass exec master -- bash -c 'microk8s enable ingress'
echo 'Copy Local File to Multipass Instance'
multipass transfer .bash_aliases master:.bash_aliases
multipass exec master -- bash -c 'cat ~/.bash_aliases'
multipass exec master -- bash -c 'mkdir ingress'
multipass transfer ingress/ingress-service.yaml master:ingress/ingress-service.yaml
multipass transfer ingress/apply.cmd  master:ingress/apply.cmd
multipass exec master -- bash -c 'ls -las  ingress
#multipass exec master -- bash -c 'microk8s kubectl apply -f ingress/ingress-service.yaml'
multipass shell master
