# setup adminer
docker run -d \
    -p 8080:8080 \
    --name adminer \
    adminer:latest

# setup mysql-data
docker volume create mysql-data
# setup mysql container
docker run -d \
    -p 3306:3306 \
    -v mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=password \
    --name mysql \
    mysql:latest

# setup postgres-data
docker volume create postgres-data
# setup postgres container
docker run -d \
    -p 5432:5432 \
    -v postgres-data:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=password \
    --name postgres \
    postgres:latest

# setup redis-data
docker volume create redis-data
# setup redis container
docker run -d \
    -p 6379:6379 \
    -v redis-data:/data \
    --name redis \
    redis:latest

# setup mongo-data
docker volume create mongo-data
# setup mongo container
docker run -d \
    -p 27017:27017 \
    -v mongo-data:/data/configdb \
    -v mongo-data:/data/db \
    -e MONGO_INITDB_ROOT_USERNAME=root \
    -e MONGO_INITDB_ROOT_PASSWORD=password \
    --name mongo \
    mongo:latest
