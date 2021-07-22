#install metrics server for kubernetes
https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml

brew install k9s #install k9s CLI centos

kubectl rollout restart deployment [deployment_name] #restart deployment
rollout restart pods [pod_name] #restart pods

helm repo add stable https://charts.helm.sh/stable #add HELM stable repo

helm install redis stable/redis --set usePassword=false #install redis with no password authentication
helm uninstall redis #uninstall redis

helm install mongodb bitnami/mongodb --set auth.enabled=false #install mongodb without authentication
helm uninstall mongodb #uninstall mongodb
mongo --host mongodb <catalogue.js #import catalogue databese into mongodb
mongo --host mongodb <users.js #import users database into mongodb

echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo

yum install -y mongodb-org

https://github.com/imjitthu/tfas-mongo/blob/master/roles/mongo/files/catalogue.js
https://github.com/imjitthu/tfas-mongo/blob/master/roles/mongo/files/users.js

helm install rabbitmq bitnami/rabbitmq #install rabbitmq
heml uninstall rabbitmq #uninstall rabbitmq
rabbitmqctl add_user roboshop roboshop123; #add user for rabbitmq
rabbitmqctl set_user_tags roboshop administrator; #set tags for user
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" #set permissions for user
rabbitmqctl add_user roboshop roboshop123; rabbitmqctl set_user_tags roboshop administrator; rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

helm install mysql stable/mysql #install mysql
helm uninstall mysql #uninstall myql
https://github.com/imjitthu/tfas-mysql/blob/master/roles/mysql/files/shipping.zip
mysql --host mysql -u root -povHZXkVuZj < shipping.sql
kubectl get secrets mysql -o yaml #get the passwod encrypted
  mysql-password: blNJdHdFcDQycg== #encrypted password
  mysql-root-password: aVFxMDRDSjhPNA== #encrypted password
  echo blNJdHdFcDQycg== | base64 --decode ; echo #get the password
  echo aVFxMDRDSjhPNA== | base64 --decode ; echo #get the password
mysql -h hostname -u user -pPassword # login to the mysql host

helm ls #get all installed by HELM

kubectl run workstation --image=centos:7 sleep 100 #create workstation in Kubernetes
kubectl exec -it workstation /bin/bash #enter workstation shell and here we can do our lab

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts #install prometheus repo for helm
helm install prometheus prometheus-community/kube-prometheus-stack #install prometheus for kubernetes
helm search repo prometheus-community #search all the available packages in prometheus repo

helm install grafana stable/grafana #install grafana 

helm repo add elastic https://helm.elastic.co #add elastic repo for HELM
helm install filebeat elastic/filebeat #install filebeat from helm


