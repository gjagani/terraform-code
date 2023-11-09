kubectl apply -f redis-sp-pvc.yaml -n db
kubectl apply -f redis-sp-svc.yaml -n db
kubectl apply -f redis-sp.yaml -n db