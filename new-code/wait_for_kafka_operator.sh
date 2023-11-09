while [[ $(kubectl get pods -n kb -l app.kubernetes.io/name=kafka-operator -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do
    echo "waiting for kafka-operator to be ready..."
    sleep 5

done

echo "kafka-operator is ready..."
