install kubernetes plugins in the Jenkins
    1) Kubernetes Continuous Deploy (A Jenkins plugin to deploy resource configurations to a Kubernetes cluster)
        Note: Latest plugin is not working so install old one d:/DevOps/jenkins/
    2) Kubernetes plugin (this will integrate jenkins and kubenetes)

execute kubectl config view in kubernetes cluster
    you will get the configuration details

go to jenkins manage Jenkins select Manage Nodes and Clouds
    select configure clouds
    add kuberbetes config file in credentials (.kube/config)

kubectl create namespace name to create namespace for an app
kubectl get namespaces to get/list all namespaces
