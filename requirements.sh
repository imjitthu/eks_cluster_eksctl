sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile


brew install k9s #install k9s CLI centos

helm repo add stable https://charts.helm.sh/stable #add HELM stable repo

helm install redis stable/redis --set usePassword=false #install redis with no password authentication
helm uninstall redis #uninstall redis

helm install mongodb bitnami/mongodb --set auth.enabled=false #install mongodb without authentication
helm uninstall mongodb #uninstall mongodb
mongod -h hostname < catalogue.js #import catalogue databese into mongodb
mongod -h hostname < users.js #import users database into mongodb

helm install rabbitmq bitnami/rabbitmq #install rabbitmq
heml uninstall rabbitmq #uninstall rabbitmq
rabbitmqctl add_user roboshop roboshop123; #add user for rabbitmq
rabbitmqctl set_user_tags roboshop administrator; #set tags for user
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" #set permissions for user

helm install mysql stable/mysql #install mysql
helm uninstall mysql #uninstall myql
mysql -h hostname -u user -pPassword < shipping.sql
kubectl get secrets mysql -o yaml #get the passwod encrypted
  mysql-password: blNJdHdFcDQycg== #encrypted password
  mysql-root-password: aVFxMDRDSjhPNA== #encrypted password
  echo blNJdHdFcDQycg== | base64 --decode ; echo #get the password
  echo aVFxMDRDSjhPNA== | base64 --decode ; echo #get the password
mysql -h hostname -u user -pPassword # login to the mysql host

helm ls #get all installed by HELM

