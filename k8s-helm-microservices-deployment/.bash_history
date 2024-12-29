rm -rf keyfile.json 
ls
export K8S_NAME=skooldio-k8s
export K8S_ZONE=asia-southeast1-b
export PROJECT_ID=kubenetes-446214
gcloud iam service-accounts create $K8S_NAME
gcloud projects add-iam-policy-binding $PROJECT_ID   --member "serviceAccount:$K8S_NAME@$PROJECT_ID.iam.gserviceaccount.com" --role "roles/storage.admin"
gcloud iam service-accounts keys create keyfile.json --iam-account $K8S_NAME@$PROJECT_ID.iam.gserviceaccount.com
cat keyfile.json | docker login -u _json_key --password-stdin https://asia.gcr.io
gcloud iam service-accounts create $K8S_NAME
gcloud projects add-iam-policy-binding $PROJECT_ID   --member "serviceAccount:$K8S_NAME@$PROJECT_ID.iam.gserviceaccount.com" --role "roles/storage.admin"
gcloud iam service-accounts keys create keyfile.json --iam-account $K8S_NAME@$PROJECT_ID.iam.gserviceaccount.com
cat keyfile.json | docker login -u _json_key --password-stdin https://asia.gcr.io
ls
gcloud iam service-accounts keys create keyfile.json --iam-account $K8S_NAME@$PROJECT_ID.iam.gserviceaccount.com
cat keyfile.json | docker login -u _json_key --password-stdin https://asia.gcr.io
docker pull opsta/bookinfo-ratings:latest
docker pull opsta/bookinfo-productpage:latest
docker pull opsta/bookinfo-details:latest
docker pull opsta/bookinfo-reviews:latest
docker tag opsta/bookinfo-ratings:latest asia.gcr.io/$PROJECT_ID/bookinfo-ratings:dev
docker tag opsta/bookinfo-ratings:latest asia.gcr.io/$PROJECT_ID/bookinfo-ratings:uat
docker tag opsta/bookinfo-ratings:latest asia.gcr.io/$PROJECT_ID/bookinfo-ratings:prd
docker tag opsta/bookinfo-productpage:latest asia.gcr.io/$PROJECT_ID/bookinfo-productpage:dev
docker tag opsta/bookinfo-productpage:latest asia.gcr.io/$PROJECT_ID/bookinfo-productpage:uat
docker tag opsta/bookinfo-productpage:latest asia.gcr.io/$PROJECT_ID/bookinfo-productpage:prd
docker tag opsta/bookinfo-details:latest asia.gcr.io/$PROJECT_ID/bookinfo-details:dev
docker tag opsta/bookinfo-details:latest asia.gcr.io/$PROJECT_ID/bookinfo-details:uat
docker tag opsta/bookinfo-details:latest asia.gcr.io/$PROJECT_ID/bookinfo-details:prd
docker tag opsta/bookinfo-reviews:latest asia.gcr.io/$PROJECT_ID/bookinfo-reviews:dev
docker tag opsta/bookinfo-reviews:latest asia.gcr.io/$PROJECT_ID/bookinfo-reviews:uat
docker tag opsta/bookinfo-reviews:latest asia.gcr.io/$PROJECT_ID/bookinfo-reviews:prd
docker push asia.gcr.io/$PROJECT_ID/bookinfo-ratings:dev
docker push asia.gcr.io/$PROJECT_ID/bookinfo-ratings:uat
docker push asia.gcr.io/$PROJECT_ID/bookinfo-ratings:prd
docker push asia.gcr.io/$PROJECT_ID/bookinfo-productpage:dev
docker push asia.gcr.io/$PROJECT_ID/bookinfo-productpage:uat
docker push asia.gcr.io/$PROJECT_ID/bookinfo-productpage:prd
docker push asia.gcr.io/$PROJECT_ID/bookinfo-details:dev
docker push asia.gcr.io/$PROJECT_ID/bookinfo-details:uat
docker push asia.gcr.io/$PROJECT_ID/bookinfo-details:prd
docker push asia.gcr.io/$PROJECT_ID/bookinfo-reviews:dev
docker push asia.gcr.io/$PROJECT_ID/bookinfo-reviews:uat
docker push asia.gcr.io/$PROJECT_ID/bookinfo-reviews:prd
gcloud container --project "$PROJECT_ID" clusters create "$K8S_NAME" --zone "$K8S_ZONE"   --cluster-version "1.20.2-gke.2500" --release-channel "rapid" --machine-type "e2-medium"   --enable-ip-alias --image-type "COS_CONTAINERD" --disk-size "100" --num-nodes "2"   --network "default" --subnetwork "default" --preemptible
gcloud container --project "$PROJECT_ID" clusters create "$K8S_NAME"   --zone "$K8S_ZONE" --release-channel "rapid" --machine-type "e2-medium"   --enable-ip-alias --image-type "COS_CONTAINERD"   --disk-size "100" --num-nodes "2"   --network "default" --subnetwork "default" --preemptible
gcloud container clusters get-credentials $K8S_NAME --project $PROJECT_ID --zone $K8S_ZONE
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace kube-system
echo $(kubectl --namespace kube-system get services ingress-nginx-controller \
  --output jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo $(kubectl --namespace kube-system get services ingress-nginx-controller \
  --output jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo $(kubectl --namespace kube-system get services ingress-nginx-controller \
  --output jsonpath='{.status.loadBalancer.ingress[0].ip}')
kubectl get namespaces
kubectl config get-contexts
kubectl create namespace bookinfo-dev
kubectl create namespace bookinfo-uat
kubectl create namespace bookinfo-prd
kubectl get namespaces
kubectl config set-context $(kubectl config current-context) --namespace=bookinfo-dev
kubectl config get-contexts
kubectl config set-context gke_oat6-fb40f_asia-southeast1-b_skooldio-k8s --namespace=""
kubectl config get-contexts
gcloud container clusters delete skooldio-k8s --zone asia-southeast1-b --project oat6-fb40f
kubectl create deployment nginx --image=nginx
ls
kubectl get pods
kubectl get deployment
kubectl describe deployment nginx
kubectl expose deployment nginx --type LoadBalancer --port 80
kubectl get services -w
kubectl scale deployment nginx --replicas=3
kubectl get deployment,pod
kubectl set image deployment nginx nginx=httpd:2.4-alpine --record
watch -n1 kubectl get pod
kubectl get deployment
kubectl describe deployments nginx
ubectl rollout history deployment nginx
kubectl rollout history deployment nginx
kubectl rollout undo deployment nginx
kubectl rollout history deployment nginx
kubectl describe deployment nginx
kubectl create deployment apache --image=httpd:2.4-alpine
kubectl scale deployment apache --replicas=3
kubectl get deployment,pod
kubectl describe deployments nginx
kubectl describe service nginx
kubectl describe deployments apache
kubectl set selector service nginx 'app=apache'
kubectl set selector service nginx 'app=nginx'
kubectl get pod
kubectl logs apache-5d94cf486d-65m4b -f
kubectl logs apache-784f7d685c-9r56h -f
kubectl get service
kubectl exec -it apache-5d94cf486d-65m4b -- sh
kubectl exec -it apache-784f7d685c-9r56h -- sh
kubectl delete deployment nginx apache
kubectl delete service nginx
kubectl get deployment,pod
cd ~/k8s
ls
mkdir ~/k8s
cd k8s/
touch 01-pod.yaml
ls
cd ~/k8s
ls
kubectl apply -f 01-pod.yaml
kubectl get pod
kubectl exec -it busybox -- sh
kubectl api-resources
kubectl explain pod
kubectl explain pod --recursive
kubectl explain pod.spec
kubectl explain deployment
ls
touch 02-apache-deployment.yaml
touch 02-apache-service.yaml
kubectl create -f 02-apache-deployment.yaml -f 02-apache-service.yaml --record
kubectl get deployments
kubectl get services -w
kubectl get deployment
kubectl delete deployment apache
kubectl get deployment
kubectl get service
kubectl delete service apache
kubectl get service
kubectl get pod
kubectl delete pod busybox
kubectl get pod
cat ~/.docker/config.json
kubectl get secret
kubectl create secret generic registry-bookinfo   --from-file=.dockerconfigjson=$HOME/.docker/config.json   --type=kubernetes.io/dockerconfigjson
kubectl get secret
kubectl describe secret registry-bookinfo
mkdir -p ~/ratings/k8s/
touch ~/ratings/k8s/ratings-deployment.yaml
ls
cd ..
ls
cd ratings/
ls
cd k8s/
ls
touch ratings-service.yaml
ls
touch ratings-ingress.yaml
kubectl apply -f k8s/
cd ..
kubectl apply -f k8s/
kubectl get ingress
kubectl apply -f k8s/
kubectl describe ingress bookinfo-dev-ratings -n bookinfo-dev
nslookup 34.142.177.239.nip.io
kubectl logs -l app=bookinfo-dev-ratings -n bookinfo-dev
kubectl apply -f k8s/
nslookup 34.142.177.239.nip.io
kubectl logs -l app=bookinfo-dev-ratings -n bookinfo-dev
kubectl get ingress
nslookup 34.142.177.239.nip.io
kubectl describe ingress bookinfo-dev-ratings -n bookinfo-dev
kubectl apply -f k8s/
helm repo add bitnami https://charts.bitnami.com/bitnami
cd ..
ls
helm repo list
helm repo update
helm list
helm install mongodb bitnami/mongodb
kubectl get pod
kubectl get deployment
kubectl get service
kubectl get deployment
help list
helm list
kubectl get secret 
kubectl describe secret mongodb
export MONGODB_ROOT_PASSWORD=$(kubectl get secret mongodb \
  -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
exho $mongodb-root-password
echo $mongodb-root-password
echo $MONGODB_ROOT_PASSWORD
kubectl run mongodb-client --rm --tty -i --restart='Never' --image bitnami/mongodb:4.4.4-debian-10-r27   --command -- mongo admin --host mongodb --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD
kubectl run mongodb-client --rm --tty -i --restart='Never' --image bitnami/mongodb:8.0.4-debian-12-r0   --command -- mongo admin --host mongodb --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image docker.io/bitnami/mongodb:8.0.4-debian-12-r0 --command -- bash
export MONGODB_ROOT_PASSWORD=$(kubectl get secret --namespace bookinfo-dev mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 -d)
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image docker.io/bitnami/mongodb:8.0.4-debian-12-r0 --command -- bash
mongosh admin --host "mongodb" --authenticationDatabase admin -u $MONGODB_ROOT_USER -p $MONGODB_ROOT_PASSWORD
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image docker.io/bitnami/mongodb:8.0.4-debian-12-r0 --command -- bash
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never'   --env="MONGODB_ROOT_USER=$MONGODB_ROOT_USER"   --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD"   --image docker.io/bitnami/mongodb:8.0.4-debian-12-r0   --command -- bash
echo $MONGODB_ROOT_USER
echo $MONGODB_ROOT_PASSWORD
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never'   --env="MONGODB_ROOT_USER=root"   --env="MONGODB_ROOT_PASSWORD=vZsFlRcFXf"   --image docker.io/bitnami/mongodb:8.0.4-debian-12-r0   --command -- bash
kubectl get svc -n bookinfo-dev
kubectl get service
kubectl get pods -n bookinfo-dev
kubectl describe pod mongodb-d656bf7f6-dj7zc -n bookinfo-dev
kubectl edit deployment mongodb -n bookinfo-dev
kubectl edit deployment mongodb -n bookinfo-dev
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never'   --env="MONGODB_ROOT_USER=root"   --env="MONGODB_ROOT_PASSWORD=vZsFlRcFXf"   --image docker.io/bitnami/mongodb:8.0.4-debian-12-r0   --command -- bash
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image docker.io/bitnami/mongodb:8.0.4-debian-12-r0 --command -- mongo admin --host mongodb --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD -- bash
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image docker.io/bitnami/mongodb:8.0.4-debian-12-r0 --command -- mongo admin --host mongodb --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image mongo:6.0 -- mongo admin --host mongodb --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image mongo:6.0 -- mongo admin --host mongodb --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD
kubectl get svc -n bookinfo-dev
kubectl run --namespace bookinfo-dev mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image docker.io/bitnami/mongodb:8.0.4-debian-12-r0 --command -- bash
ping mongodb
kubectl run -n bookinfo-dev debug-pod --rm -it --image busybox -- sh
kubectl get svc -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl describe pod mongodb-d656bf7f6-dj7zc -n bookinfo-dev
kubectl get nodes -o wide
kubectl describe nodes
kubectl describe deployment mongodb -n bookinfo-dev
kubectl get pvc mongodb -n bookinfo-dev
kubectl describe pvc mongodb -n bookinfo-dev
kubectl get pvc mongodb -n bookinfo-dev
kubectl describe storageclass standard-rwo
ls
mkdir ~/bookinfo-secre
touch ~/bookinfo-secret/bookinfo-dev-ratings-mongodb-secret.yaml
ls
cd bookinfo-secre/
touch bookinfo-dev-ratings-mongodb-secret.yaml
ls
cd ..
rm -rf bookinfo-secre/
mkdir ~/bookinfo-secret
cd bookinfo-secret/
touch bookinfo-dev-ratings-mongodb-secret.yaml
kubectl apply -f ~/bookinfo-secret/bookinfo-dev-ratings-mongodb-secret.yaml
kubectl get secret
kubectl describe secret bookinfo-dev-ratings-mongodb-secret
echo $(kubectl get secret bookinfo-dev-ratings-mongodb-secret \
  -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
echo $(kubectl get secret bookinfo-dev-ratings-mongodb-secret \
  -o jsonpath="{.data.mongodb-password}" | base64 --decode)
mkdir ~/ratings/k8s/helm-values/
ls
cd ..
ls
cd ratings/k8s/
ls
cd helm-values/
ls
touch values-bookinfo-dev-ratings-mongodb.yaml
cd ..
ls
cd k8s/
cd ..
ls
cd ratings/
mkdir databases
ls
cd databases/
ls
touch ratings_data.json
ls
touch script.sh
ls
kubectl create configmap bookinfo-dev-ratings-mongodb-initdb   --from-file=databases/ratings_data.json   --from-file=databases/script.sh
cd ..
kubectl create configmap bookinfo-dev-ratings-mongodb-initdb   --from-file=databases/ratings_data.json   --from-file=databases/script.sh
kubectl get configmap
helm list
helm delete mongodb
helm install -f k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml   bookinfo-dev-ratings-mongodb bitnami/mongodb
cat MONGODB_ROOT_PASSWORD
export MONGODB_ROOT_PASSWORD=$(kubectl get secret mongodb \
  -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
kubectl get secret
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install mongodb bitnami/mongodb
helm list
kubectl get pod
kubectl get deployment
kubectl get service
kubectl get secret
kubectl describe secret mongodb
export MONGODB_ROOT_PASSWORD=$(kubectl get secret mongodb \
  -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
cat MONGODB_ROOT_PASSWORD
MONGODB_ROOT_PASSWOR
MONGODB_ROOT_PASSWORD
helm install -f k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml   bookinfo-dev-ratings-mongodb bitnami/mongodb
kubectl apply -f ~/bookinfo-secret/bookinfo-dev-ratings-mongodb-secret.yaml
kubectl get secret
kubectl describe secret bookinfo-dev-ratings-mongodb-secret
echo $(kubectl get secret bookinfo-dev-ratings-mongodb-secret \
  -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
echo $(kubectl get secret bookinfo-dev-ratings-mongodb-secret \
  -o jsonpath="{.data.mongodb-password}" | base64 --decode)
helm install -f k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml   bookinfo-dev-ratings-mongodb bitnami/mongodb
kubectl get secret bookinfo-dev-ratings-mongodb-secret -n bookinfo-dev
kubectl describe secret bookinfo-dev-ratings-mongodb-secret -n bookinfo-dev
kubectl get secret bookinfo-dev-ratings-mongodb-secret -n bookinfo-dev -o yaml
helm install -f k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml   bookinfo-dev-ratings-mongodb bitnami/mongodb
kubectl describe configmap bookinfo-dev-ratings-mongodb-initdb
kubectl apply -f ~/bookinfo-secret/bookinfo-dev-ratings-mongodb-secret.yaml
kubectl get secret
kubectl describe secret bookinfo-dev-ratings-mongodb-secret
echo $(kubectl get secret bookinfo-dev-ratings-mongodb-secret \
  -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
echo $(kubectl get secret bookinfo-dev-ratings-mongodb-secret \
  -o jsonpath="{.data.mongodb-password}" | base64 --decode)
helm install -f k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml   bookinfo-dev-ratings-mongodb bitnami/mongodb
export MONGODB_ROOT_PASSWORD=$(kubectl get secret bookinfo-dev-ratings-mongodb-secret \
  -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
echo $MONGODB_ROOT_PASSWORDS
echo $MONGODB_ROOT_PASSWORD
export MONGODB_ROOT_PASSWORDS=$(kubectl get secret bookinfo-dev-ratings-mongodb-secret \
  -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
echo $MONGODB_ROOT_PASSWORDS
kubectl run mongodb-client --rm --tty -i --restart='Never' --image bitnami/mongodb:4.4.4-debian-10-r27   --command -- mongo admin --host bookinfo-dev-ratings-mongodb --authenticationDatabase admin \
kubectl run mongodb-client --rm --tty -i --restart='Never' --image bitnami/mongodb:4.4.4-debian-10-r27   --command -- mongo admin --host bookinfo-dev-ratings-mongodb --authenticationDatabase admin   -u root -p $MONGODB_ROOT_PASSWORD
kubectl run --namespace bookinfo-dev bookinfo-dev-ratings-mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image docker.io/bitnami/mongodb:4.4.4-debian-10-r27 --command -- bash
kubectl run mongodb-client --rm --tty -i --restart='Never' --image bitnami/mongodb:4.4.4-debian-10-r27   --command -- mongo admin --host bookinfo-dev-ratings-mongodb --authenticationDatabase admin   -u root -p $MONGODB_ROOT_PASSWORD
kubectl get pods -n bookinfo-dev
kubectl get svc -n bookinfo-dev
kubectl describe pod bookinfo-dev-ratings-mongodb-7fb96899c7-n6l92 -n bookinfo-dev
kubectl describe pod mongodb-d656bf7f6-gtdx6
kubectl top nodes
kubectl describe deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
kubectl describe deployment mongodb
kubectl describe deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
kubectl describe nodes | grep -A5 "Allocatable"
kubectl describe nodes
kubectl describe deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
kubectl get pvc -n bookinfo-dev
kubectl get events -n bookinfo-dev
kubectl edit deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
kubectl delete pod -l app.kubernetes.io/name=mongodb -n bookinfo-dev
kubectl get pvc -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl describe pod -n bookinfo-dev bookinfo-dev-ratings-mongodb-585fc6479f-mnm8z
kubectl get deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
gcloud container clusters resize skooldio-k8s --node-pool=default-pool --num-nodes=3
gcloud container clusters resize skooldio-k8s --node-pool=default-pool --num-nodes=3 --zone=asia-southeast1-b
kubectl get service
helm install -f k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml   bookinfo-dev-ratings-mongodb bitnami/mongodb
kubectl run mongodb-client --rm --tty -i --restart='Never' --image bitnami/mongodb:4.4.4-debian-10-r27   --command -- mongo admin --host bookinfo-dev-ratings-mongodb --authenticationDatabase admin   -u root -p $MONGODB_ROOT_PASSWORD
kubectl get pods -n bookinfo-dev
kubectl get deployments --all-namespaces
k
kubectl scale deployment details --replicas=0 -n bookinfo-dev
kubectl scale deployment reviews --replicas=0 -n bookinfo-dev
kubectl scale deployment productpage --replicas=0 -n bookinfo-dev
kubectl get deployments -n bookinfo-dev
kubectl get deployments --all-namespaces
kubectl scale deployment gmp-operator --replicas=0 -n gmp-system
kubectl scale deployment rule-evaluator --replicas=0 -n gmp-system
kubectl get deployments --all-namespaces
kubectl top nodes
kubectl get pods -n bookinfo-dev
kubectl describe pod bookinfo-dev-ratings-mongodb-585fc6479f-mnm8z -n bookinfo-dev
kubectl top nodes
gcloud container clusters resize skooldio-k8s --node-pool=default-pool --num-nodes=3 --zone=asia-southeast1-b
kubectl scale deployment details --replicas=0 -n bookinfo-dev
kubectl scale deployment reviews --replicas=0 -n bookinfo-dev
kubectl scale deployment productpage --replicas=0 -n bookinfo-dev
kubectl scale deployment gmp-operator --replicas=0 -n gmp-system
kubectl scale deployment rule-evaluator --replicas=0 -n gmp-system
kubectl get deployments --all-namespaces
kubectl delete pod -l app.kubernetes.io/name=mongodb -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl describe pod bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev
gcloud container clusters update skooldio-k8s --enable-autoscaling --min-nodes=2 --max-nodes=5 --zone=asia-southeast1-b --node-pool=default-pool
kubectl describe pod bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl describe pod bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev
gcloud container clusters resize skooldio-k8s --node-pool=default-pool --num-nodes=3 --zone=asia-southeast1-b
gcloud container node-pools create smaller-pool     --cluster=skooldio-k8s     --zone=asia-southeast1-b     --num-nodes=1     --machine-type=e2-medium     --disk-size=50
kubectl describe pod bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl describe pod bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev
kubectl top pod bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev
kubectl describe node gke-skooldio-k8s-smaller-pool-ad2f2a9f-m98k
kubectl describe pod bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl describe pod bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev
kubectl logs bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev -c mongodb
kubectl describe deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
kubectl delete pod bookinfo-dev-ratings-mongodb-585fc6479f-jgrp9 -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl delete pod bookinfo-dev-ratings-mongodb-7fb96899c7-8x2hx -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl delete pod bookinfo-dev-ratings-767d446c74-6ffb2 -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl get pods
kubectl describe deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
kubectl edit deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
kubectl get pods -n bookinfo-dev
cd ..
kubectl apply -f ~/ratings/k8s/
kubectl get dev,deployment
kubectl get deployment
kubectl get pods -n bookinfo-dev
kubectl get pod
kubectl describe pod mongodb-d656bf7f6-ldlkj -n bookinfo-dev
kubectl delete replicaset mongodb-d656bf7f6 -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl delete replicaset bookinfo-dev-ratings-mongodb-7fb96899c7-v6p8 -n bookinfo-dev
kubectl describe pod bookinfo-dev-ratings-mongodb-7fb96899c7-v6p8 -n bookinfo-dev
kubectl delete replicaset bookinfo-dev-ratings-mongodb-7fb96899c7 -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl describe pod bookinfo-dev-ratings-mongodb-585fc6479f-vpg7f -n bookinfo-dev
kubectl delete replicaset mongodb-d656bf7f6 -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl get deployment,statefulset -n bookinfo-dev | grep mongodb
kubectl delete deployment mongodb -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl edit deployment bookinfo-dev-ratings -n bookinfo-dev
kubectl rollout status deployment bookinfo-dev-ratings -n bookinfo-dev
kubectl get pods -n bookinfo-dev
kubectl describe node bookinfo-dev-ratings-568b874cc4-4kw5r
kubectl get pod bookinfo-dev-ratings-mongodb-585fc6479f-vpg7f -n bookinfo-dev -o wide
kubectl get pod bookinfo-dev-ratings-568b874cc4-4kw5r -n bookinfo-dev -o wide
kubectl get pods -o wide -n bookinfo-dev
kubectl edit deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
ls
cd ratings/
ls
kubectl delete -f k8s/
cd databases/
ls
kubectl rollout status deployment bookinfo-dev-ratings-mongodb -n bookinfo-dev
cd ..
cd k8s/
ls
cat helm-values/
cd ..
helm repo add bitnami-pre-2022 https://raw.githubusercontent.com/bitnami/charts/pre-2022/bitnami
mkdir ~/ratings/k8s/helm
ls
cd k8s/
ls
cd helm
cd ..
cd helm-values/
ls
cd ..
cd
ls
cd ratings/
ls
cd k8s/
ls
cd helm
touch Chart.yaml
ls
helm list
mv k8s/ratings-*.yaml k8s/helm/templates/
cd ..
mv k8s/ratings-*.yaml k8s/helm/templates/
cd ..
mv k8s/ratings-*.yaml k8s/helm/templates/
mkdir ~/ratings/k8s/helm
mv k8s/ratings-*.yaml k8s/helm/templates/
ls
cd ratings/
ls
cd k8s/
ls
cd helm
mv k8s/ratings-*.yaml k8s/helm/templates/
mkdir ~/ratings/k8s/helm/templates
mv k8s/ratings-*.yaml k8s/helm/templates/
ls
cd templates/
mv k8s/ratings-*.yaml k8s/helm/templates/
cd ..
mv k8s/ratings-*.yaml k8s/helm/templates/
helm install bookinfo-dev-ratings k8s/helm
helm list
helm install -f ~/ratings/k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml   bookinfo-dev-ratings-mongodb bitnami-pre-2022/mongodb --version 10.0.1
helm upgrade -f bookinfo-dev-ratings k8s/helm
helm upgrade bookinfo-dev-ratings k8s/helm
helm list
get pod
kubectl get pod
ls
cd k8s/
ls
cd helm
cd ..
cd helm-values/
touch values-bookinfo-dev-ratings.yaml
ls
helm upgrade -f k8s/helm-values/values-bookinfo-dev-ratings.yaml   bookinfo-dev-ratings k8s/helm
cd ..
helm upgrade -f k8s/helm-values/values-bookinfo-dev-ratings.yaml   bookinfo-dev-ratings k8s/helm
helm upgrade -f k8s/helm-values/values-bookinfo-dev-ratings.yaml   bookinfo-dev-ratings k8s/helm
helm upgrade -f k8s/helm-values/values-bookinfo-dev-ratings.yaml   bookinfo-dev-ratings k8s/helm
cd ..
kubectl config set-context $(kubectl config current-context) --namespace=bookinfo-uat
kubectl create configmap bookinfo-uat-ratings-mongodb-initdb   --from-file=databases/ratings_data.json   --from-file=databases/script.sh
