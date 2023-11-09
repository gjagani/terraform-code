helm repo add timescale 'https://charts.timescale.com'
helm pull timescale/timescaledb-single
helm install timescale-db-v15-dev timescaledb-single-dev -n dbdev