# kubectl apply -f auth-generator-pod.yaml -n util

# kubectl exec -it auth-generator-pod-0 -n util -- bash

# ##CONFIGURE SECRET AND INGRESS RULE FOR CRATEDB WEB ACCESS
# apt-get update
# apt-get install apache2-utils
# htpasswd -c auth redisadmin
# #SYSTEM WILL ASK PASSWORD TO BE SET
# cat auth
# #CREATE AND SAVE FILE NAMED "auth" IN LOCAL DIRECTORY AND PASTE OUTPUT AS A CONTENT FROM ABOVE COMMAND



# kubectl create secret generic redis-insight-auth -n db --from-file=auth

# ############################installation step in DFE#############################################

kubectl apply -f redis-insight-pvc.yaml -n db
kubectl apply -f redis-insight.yaml -n db
kubectl apply -f redis-insight-ingress-rule.yaml -n db
