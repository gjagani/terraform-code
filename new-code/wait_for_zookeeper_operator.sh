while [[ $(kubectl get pods -n kb -l app=zookeeper-operator -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do
    echo "waiting for zookeeper-operator to be ready..."
    sleep 5

done

echo "zookeeper-operator is ready..."