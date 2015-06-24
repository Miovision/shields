./build.sh && \
./push.sh && \
(fleetctl --endpoint http://etcd-cluster.corp.miocloud:4001 stop shields ; \
 fleetctl --endpoint http://etcd-cluster.corp.miocloud:4001 start shields) && \
echo "watch the logs with:    fleetctl --endpoint http://etcd-cluster.corp.miocloud:4001 journal -f -lines=200 shields"