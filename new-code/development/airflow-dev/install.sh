# kubectl create cm requirements --from-file=airflow-util/requirements.txt -n airflow
helm install airflow-dev airflow-2.6.3 -n airflowdev
kubectl apply -f custom-rbac.yaml