while [[ $(kubectl get pods -n kb -l app=zookeeper -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True" ] || [ $(kubectl get pods -n kbdev -l app=zookeeper -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True" ]]; do
  echo "waiting for zookeeper pods to be ready..."
  sleep 5

done

echo "zookeeper is ready!"