# PostgreSQL and PGAdmin

>![NOTE]
>This guide instructs you on how to deploy a test database with PGAdmin.

## Run

To run the container, simply run `docker-compose up -d` in this directory.

## Manage

### Connect Database to PGAdmin

To connect the database, you need the IP of the database from inside Docker, to get this run `docker container ls` to get the container id for the db. Then armed with the id, use it to get the IP address with docker inspect:

```bash
docker inspect <CONTAINER_ID>
```

Take the IP address under networks and that will be your hostname and the port will be the natural port of the database **NOT the exposed port**.

The credentials on the database are set as `-u user and -p password`.
