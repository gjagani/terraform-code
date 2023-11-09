# kubectl create cm requirements --from-file=airflow-util/requirements.txt -n airflow
helm install airflow airflow-2.6.3 -n airflow
kubectl apply -f custom-rbac.yaml