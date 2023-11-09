kubectl apply -f grafana-pvc.yaml -n monitoring
kubectl apply -f loki-secret.yaml -n monitoring
helm install isg-pga kube-prometheus-stack -n monitoring
helm install isg-loki loki-stack -n monitoring 
### kafka should be running before installing prometheus-kafka-exporter
helm install isg-pkafka prometheus-kafka-exporter -n monitoring