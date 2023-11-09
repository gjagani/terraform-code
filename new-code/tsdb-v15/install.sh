helm repo add timescale 'https://charts.timescale.com'
helm pull timescale/timescaledb-single
helm install timescale-db-v15 timescaledb-single -n db