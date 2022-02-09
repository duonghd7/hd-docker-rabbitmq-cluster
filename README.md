1: Create file ~> haproxy.cfg
2: Create file ~> Dockerfile
3: Build haproxy-server ~> docker build -t haproxy-server .
4: Create file ~> docker-compose.yml
5: Rundocker   ~> docker-compose -f docker-compose.yml up
6: Create cluster RabbisMQ
a: Stop child node ~>
    docker exec -ti rabbitmq-node-2 bash -c "rabbitmqctl stop_app"
    docker exec -ti rabbitmq-node-3 bash -c "rabbitmqctl stop_app"
b: Join child node to main node ~>
    docker exec -ti rabbitmq-node-2 bash -c "rabbitmqctl join_cluster rabbit@rabbitmq-node-1"
    docker exec -ti rabbitmq-node-3 bash -c "rabbitmqctl join_cluster rabbit@rabbitmq-node-1"
c: Start child node ~>
    docker exec -ti rabbitmq-node-2 bash -c "rabbitmqctl start_app"
    docker exec -ti rabbitmq-node-3 bash -c "rabbitmqctl start_app"