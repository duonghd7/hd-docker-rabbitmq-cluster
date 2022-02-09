#HA version 1.9, bạn có thể chọn 1.8, 1.7
FROM haproxy
#Lệnh copy file haproxy.cfg vào docker image
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
