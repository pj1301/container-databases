# Using Docker Containerised MongoDB Image

## Run

To start fresh:

```bash
docker-compose up -d
```

To manage:

```bash
docker-compose stop # temporarily stop container
docker-compose start # start stopped container
docker-compose restart # restart running container

docker-compose down # stop and remove container
```

&nbsp;

## Connecting To DB UI Management

### MongoExpress

The MongoExpress application which is included inside the docker-compose setup can be accessed at port 5601 on localhost.

### Compass

Whilst the docker-compose file does include a UI for accessing the database (Node-based MongoExpress) you can also connect with MongoCompass.

Assuming you have already downloaded and set up the Compass application, you cann connect with the following string:

```bash
mongodb://USERNAME:PASSWORD@127.0.0.1:27017/?authSource=admin&readPreference=primary&appname=MongoDB%20Compass&ssl=false

# Pattern:
# mongodb://<username>:<password>@<url>:<port>/?authSource=admin
```

> [!IMPORTANT]
> The port must be exposed in the docker-compose file to be able to connect via compass in this way

&nbsp;

## Notes

### Environment Variables

```yml
# for mongodb
environment:
    - "MONGO_INITDB_ROOT_USERNAME=USERNAME"
    - "MONGO_INITDB_ROOT_PASSWORD=PASSWORD"

# for mongoexpress
environment:
    - "ME_CONFIG_MONGODB_SERVER=mongodb"
    - "ME_CONFIG_MONGODB_AUTH_DATABASE=admin"
    - "ME_CONFIG_MONGODB_ENABLE_ADMIN=true"
    - "ME_CONFIG_MONGODB_ADMINUSERNAME=USERNAME"
    - "ME_CONFIG_MONGODB_ADMINPASSWORD=PASSWORD"
```

* Username and password variables should be matched
* The `AUTH_DATABASE` variable should be admin and this appears to set `authSource=admin` at the end of the connection string
* If `ENABLE_ADMIN` is true, then `ADMINUSERNAME` and `ADMINPASSWORD` are required, otherwise use basic auth
