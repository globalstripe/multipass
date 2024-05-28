multipass exec node1 -- sudo snap install microk8s --classic
multipass exec node1 -- sudo usermod -a -G microk8s ubuntu
multipass exec node1 -- sudo chown -f -R ubuntu ~/.kube
