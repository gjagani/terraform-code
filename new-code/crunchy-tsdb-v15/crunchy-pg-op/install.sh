https://www.crunchydata.com/blog/topic/production-postgres

https://access.crunchydata.com/documentation/postgres-operator/5.2.0/tutorial/customize-cluster/#database-initialization-sql
https://access.crunchydata.com/documentation/postgres-operator/4.7.1/advanced/custom-configuration/
https://www.crunchydata.com/blog/multi-cloud-strategies-with-crunchy-postgres-for-kubernetes
https://access.crunchydata.com/documentation/postgres-operator/4.5.0/architecture/high-availability/multi-cluster-kubernetes/

https://www.crunchydata.com/blog/multi-kubernetes-cluster-postgresql-deployments
https://www.crunchydata.com/blog/deploy-high-availability-postgresql-on-kubernetes
https://www.crunchydata.com/blog/multifactor-sso-authentication-for-postgres-on-kubernetes

https://www.crunchydata.com/blog/using-timescaledb-extension-with-the-pgo-the-postgres-operator
https://www.crunchydata.com/blog/performance-and-spatial-joins
https://www.crunchydata.com/blog/the-many-spatial-indexes-of-postgis?CrunchyAnonId=aohitbeulfusqzcnywjslmgbykuxkrpuzxsvshhrftpxbyb
https://access.crunchydata.com/documentation/postgres-operator/5.0.0/tutorial/disaster-recovery/
https://www.crunchydata.com/blog/pgbackrest-file-bundling-and-block-incremental-backup
https://www.crunchydata.com/developers/playground/psql-basics


https://github.com/CrunchyData/postgres-operator-examples/blob/main/helm/install/values.yaml

kubectl kustomize ./

helm install 511nj-postgres-opr pgo -n db
kubectl -n db create configmap active-511nj-pg-init-sql --from-file=init.sql=init.sql
kubectl create -f 511nj-azure-secret.yaml -n db
kubectl create -f 511nj-pg-cluster-custom-cert.yaml -n db
kubectl create -f 511nj-pg-replication-custom-cert.yaml -n db
kubectl create -f 1-active-511nj-pg.yaml -n db

kubectl patch secret -n db active-511nj-pguser-isgpguser -p \
   '{"stringData":{"password":"123@NjMpTs","verifier":""}}'

kubectl patch secret -n db active-511nj-pguser-isgpgbouncerusr -p \
   '{"stringData":{"password":"123@NjMpTs","verifier":""}}'

kubectl patch secret -n db active-511nj-pguser-postgres -p \
   '{"stringData":{"password":"Inf0Sense$2@","verifier":""}}'

kubectl patch secret -n dbdev active-511nj-pguser-postgres -p \
   '{"stringData":{"password":"123@NjMpTs","verifier":""}}'

kubectl patch secret -n db active-511nj-pguser-nativelinkcondi -p \
   '{"stringData":{"password":"gay8Ffz!5MS_nativelink","verifier":""}}'

kubectl -n db create configmap standby-511nj-pg-init-sql --from-file=init.sql=init.sql
kubectl create -f 511nj-pg-cluster-custom-cert.yaml -n db
kubectl create -f 511nj-pg-replication-custom-cert.yaml -n db

kubectl patch secret -n db standby-511nj-pguser-isgpguser -p \
   '{"stringData":{"password":"123@NjMpTs","verifier":""}}'

kubectl patch secret -n db standby-511nj-pguser-isgpgbouncerusr -p \
   '{"stringData":{"password":"123@NjMpTs","verifier":""}}'

kubectl patch secret -n db standby-511nj-pguser-nativelinkcondi -p \
   '{"stringData":{"password":"gay8Ffz!5MS_nativelink","verifier":""}}'

kubectl patch secret -n db standby-511nj-pguser-postgres -p \
   '{"stringData":{"password":"Inf0Sense$2@","verifier":""}}'

GRANT ALL ON ALL TABLES IN SCHEMA public TO hardik;

kubectl patch postgrescluster standby-511nj -n db --type merge \
  --patch '{"spec":{"shutdown": true}}'

kubectl patch postgrescluster active-511nj -n db --type merge \
  --patch '{"spec":{"shutdown": true}}'


kubectl patch postgrescluster/postgres-511nj -n db --type merge \
  --patch '{"spec":{"standby": {"enabled": true}}}'
  
kubectl patch postgrescluster/active-511nj -n db --type merge \
  --patch '{"spec":{"shutdown": false}}'

kubectl patch postgrescluster/postgres-511nj -n db --type merge \
  --patch '{"spec":{"standby": {"enabled": false}}}'

<<<<<<< HEAD
kubectl patch postgrescluster active-511nj -n db --type merge \
=======
kubectl patch postgrescluster standby-511nj -n db --type merge \
>>>>>>> 44bc405 (Added native link user.)
  --patch '{"spec":{"shutdown": true}}'

kubectl patch postgrescluster postgres-511nj -n db --patch-file 511nj-postgres-scale.yaml

# To restore backup.
kubectl annotate postgrescluster active-511nj -n db --overwrite \
  postgres-operator.crunchydata.com/pgbackrest-restore=id1

# To take backup.
kubectl annotate -n db postgrescluster postgres-511nj --overwrite \
  postgres-operator.crunchydata.com/pgbackrest-backup="2023-10-03 16:00:00"

# START: Set target instance
kubectl get pods -n db -l postgres-operator.crunchydata.com/cluster=postgres-511nj \
    -L postgres-operator.crunchydata.com/instance \
    -L postgres-operator.crunchydata.com/role

spec:
  patroni:
    switchover:
      enabled: true
      targetInstance: hippo-instance1-wm5p

spec:
  patroni:
    switchover:
      enabled: true
      targetInstance: hippo-instance1-wm5p
      type: Failover
# END: =======

# To force the replication, execute 'select pg_switch_wal();' on the production instance to force a WAL segment switch and archive.