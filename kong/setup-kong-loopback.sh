# create admin-api services
curl --location --request POST 'http://localhost:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "admin-api",
    "host": "localhost",
    "port": 8001
}'

# create admin-api routes
curl --location --request POST 'http://localhost:8001/services/admin-api/routes' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "admin-api",
    "paths": ["/admin-api"]
}'

# setup connection loop back on konga
# Name: admin-api
# Kong Admin URL: http://kong:8000/admin-api/

# if you want to setup key auth for better security
# create admin-api key auth plugin
curl -X POST http://localhost:8001/services/admin-api/plugins \
    --data "name=key-auth"

# add konga as consumer
curl --location --request POST 'http://localhost:8001/consumers/' \
--form 'username=konga' \

# create api key for konga
curl --location --request POST 'http://localhost:8001/consumers/e7b420e2-f200-40d0-9d1a-a0df359da56e/key-auth'

# setup connection loop back on konga
# Name: admin-api
# Kong Admin URL: http://kong:8000/admin-api/
# API Key: <insert_api_key>