sudo docker run -d -p 8081:8081 \
  -p 5000:5000 \
  -p 8083:8083  \
  -p 8085:8085 \
  --restart always \
  --name nexus \
  -v /data/nexus-data:/nexus-data \
  nexus3:latest