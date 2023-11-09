##https://github.com/maplibre/martin
##https://maplibre.org/martin/run-with-cli.html
##https://www.youtube.com/watch?v=ijejfRcQI-I
##https://wiki.openstreetmap.org/wiki/Slippy_map_tilenames#PostgreSQL

##http://localhost:3000/catalog
##http://localhost:3000/streets
##http://localhost:3000/streets/10/300/384
http://martin-test.isgsuite.com/function_street_zxy_query
http://martin-test.isgsuite.com/street_route_osm_func/10/300/384

kubectl create configmap martin-cfg -n web --from-file=config.yaml
kubectl create configmap nginx-cfg -n web --from-file=nginx.conf

kubectl apply -f martin.yaml -n web
kubectl apply -f martin-svc.yaml -n web

kubectl delete -f martin.yaml -n web
kubectl delete -f martin-svc.yaml -n web

kubectl apply -f martin-ingress-rule.yaml -n web