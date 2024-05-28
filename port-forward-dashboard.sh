./token.sh
echo "Make sure you have enabled the dashboard: #microks8 enable dashboard"
echo "Make sure you have enabled ingress: #microk8s enable ingress"
ip=`multipass info master | grep IPv4 | awk '{ print $2 }'`
echo "Point your local browser at https://$ip:10443"
multipass exec master -- sudo /snap/bin/microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 --address 0.0.0.0
