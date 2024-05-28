./token.sh
echo "Point your local browser at https://192.168.64.10:10443"
multipass exec master -- sudo /snap/bin/microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 --address 0.0.0.0
