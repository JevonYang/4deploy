sudo docker run --detach \
  --hostname your-hostname \
  --publish 9443:443 --publish 8880:80 --publish 2222:22 \
  --name gitlab \
  --restart always \
  --volume /data/gitlab/config:/etc/gitlab \
  --volume /data/gitlab/logs:/var/log/gitlab \
  --volume /data/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:13.9.7-ce.0
