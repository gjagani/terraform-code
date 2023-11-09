while [[ $(kubectl get pods -n db -l app=redis-sp -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do
    echo "waiting for redis-sp pods to be ready..."
    sleep 5

done

echo "redis-sp is ready!"