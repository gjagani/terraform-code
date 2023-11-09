while [[ $(kubectl get pods -n kb -l app=kafka-client -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ] || [ $(kubectl get pods -n kbdev -l app=kafka-client -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ] ]; do
    echo "waiting for kafka-client pods to be ready..."
    sleep 5
done
echo "kafka-client is ready!"