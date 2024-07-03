## Using postgresql with Docker

Set up .env file

```
POSTGRES_USER=
POSTGRES_PW=
POSTGRES_DB=
PGADMIN_MAIL=
PGADMIN_PW=
```

The values will be used in the pgadmin container<br>

Compose with docker

```bash
docker compose up -d
```

For pgadmin go to

<a href="http:localhost:6060">http:localhost:6060</a>

Login pgadmin using the `PGADMIN_MAIL`, `PGADMIN_PW`

Register Server:
In Connection tab, write host name, get IP address/Gateway from

```bash
docker inspect <containerID>
```

Port:`5432`
Maintenance database: `POSTGRES_DB`
Username: `POSTGRES_USER`
Password: `POSTGRES_PW`

A new database is created, create a schema
Right click on the Schema section, go to query Tool and open folder then click on upload files and upload both sql files.
Click on each of the sql files and execute them.
