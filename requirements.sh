sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

brew install k9s #install k9s CLI centos

kubectl rollout restart deployment [deployment_name] #restart deployment
rollout restart pods [pod_name] #restart pods

helm repo add stable https://charts.helm.sh/stable #add HELM stable repo

helm install redis stable/redis --set usePassword=false #install redis with no password authentication
helm uninstall redis #uninstall redis

helm install mongodb bitnami/mongodb --set auth.enabled=false #install mongodb without authentication
helm uninstall mongodb #uninstall mongodb
mongod -h hostname < catalogue.js #import catalogue databese into mongodb
mongod -h hostname < users.js #import users database into mongodb

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

helm install mysql stable/mysql #install mysql
helm uninstall mysql #uninstall myql
https://github.com/imjitthu/tfas-mysql/blob/master/roles/mysql/files/shipping.zip
mysql -h hostname -u user -pPassword < shipping.sql
kubectl get secrets mysql -o yaml #get the passwod encrypted
  mysql-password: blNJdHdFcDQycg== #encrypted password
  mysql-root-password: aVFxMDRDSjhPNA== #encrypted password
  echo blNJdHdFcDQycg== | base64 --decode ; echo #get the password
  echo aVFxMDRDSjhPNA== | base64 --decode ; echo #get the password
mysql -h hostname -u user -pPassword # login to the mysql host

helm ls #get all installed by HELM

kubectl run workstation --image=centos:7 sleep 100 #create workstation in Kubernetes
kubectl exec -it workstation /bin/bash #enter workstation shell and here we can do our lab

