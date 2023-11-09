while [[ $(kubectl get pods -n kb -l app=kafka -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True True" ] || [ $(kubectl get pods -n kbdev -l app=kafka -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True True" ]]; do
  echo "waiting for kafka broker to be ready..."
  sleep 5

done

while [[ $(kubectl get pods -n kb -l app=cruisecontrol -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ] || [ $(kubectl get pods -n kbdev -l app=cruisecontrol -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do
  echo "waiting for cruisecontroler to be ready..."
  sleep 5

done

echo "kafka cluster is running!"