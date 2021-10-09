docker run --name mysql \
    -p 3306:3306 \
    -v /data/mysql/conf:/etc/mysql/conf.d \
    -v /data/mysql/data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=your-pass \
    -d mysql:5.7 \
    --character-set-server=utf8mb4 \
    --collation-server=utf8mb4_unicode_ci

docker run -d \
    -p 5432:5432 \
    --name postgres \
    -e POSTGRES_PASSWORD=your-pass \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /data/postgres:/var/lib/postgresql/data \
    postgres