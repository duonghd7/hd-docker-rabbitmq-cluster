# RabbitMQ cluster with HAProxy and Docker Compose

![image](https://user-images.githubusercontent.com/18477507/153174563-ab03b29d-097d-45a1-90ec-539b0e74f997.png)

### 1. Create file<br>
[haproxy.cfg](https://github.com/duonghd7/hd-docker-rabbitmq-cluster/blob/master/haproxy.cfg)<br>
[Dockerfile](https://github.com/duonghd7/hd-docker-rabbitmq-cluster/blob/master/Dockerfile)<br>
[docker-compose.yml](https://github.com/duonghd7/hd-docker-rabbitmq-cluster/blob/master/docker-compose.yml)<rb>

### 2. Build haproxy-server
```code
docker build -t haproxy-server .
```
### 3. Rundocker
```code
docker-compose -f docker-compose.yml up
```
### 4. Create cluster RabbisMQ<br><br>
##### a: Stop child node
```code
docker exec -ti rabbitmq-node-2 bash -c "rabbitmqctl stop_app"
docker exec -ti rabbitmq-node-3 bash -c "rabbitmqctl stop_app"
```
##### b: Join child node to main node
```code
docker exec -ti rabbitmq-node-2 bash -c "rabbitmqctl join_cluster rabbit@rabbitmq-node-1"
docker exec -ti rabbitmq-node-3 bash -c "rabbitmqctl join_cluster rabbit@rabbitmq-node-1"
```
##### c: Start child node
```code
docker exec -ti rabbitmq-node-2 bash -c "rabbitmqctl start_app"
docker exec -ti rabbitmq-node-3 bash -c "rabbitmqctl start_app"
```

Access HAProxy statistics report at http://localhost:1936/haproxy?stats with the credential [haproxy:haproxy](https://github.com/duonghd7/hd-docker-rabbitmq-cluster/blob/master/haproxy.cfg), and the RabbitMQ console at http://localhost:15672/# with the credential [root:1234567](https://github.com/duonghd7/hd-docker-rabbitmq-cluster/blob/master/.env).
