sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# yum list docker-ce --showduplicates | sort -r
#由于repo中默认只开启stable仓库，故这里安装的是最新稳定版17.12.0
sudo yum makecache
sudo yum install docker-ce

curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

cat > /etc/docker/daemon.json <<eof
{
   "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"],
   "insecure-registries": ["your-docker-registery:5000"]
}
eof

sudo systemctl daemon-reload
sudo systemctl restart docker

