## Using postgresql with Docker

Set up .env file

```
POSTGRES_USER=
POSTGRES_PW=
POSTGRES_DB=
PGADMIN_MAIL=
PGADMIN_PW=
```

In docker-compose.yml
In /var/lib/pgadmin/storage/admin_bob.com, the admin_bob.com should be replaced depending on the `PGADMIN_MAIL` (if `PGADMIN_MAIL`=admin@bob.com then it should be admin_bob.com)

The values will be used in the pgadmin container<br>

Compose with docker

```bash
docker compose up -d
```

For pgadmin go to

<a href="http:localhost:5050">http:localhost:5050</a>

Login pgadmin using the `PGADMIN_MAIL`, `PGADMIN_PW`

Register Server:
In Connection tab, write host name from IP address/Gateway from

```bash
docker inspect <containerID>
```

or
simply write host name= `postgres`

Port:`5432`
Maintenance database: `POSTGRES_DB`
Username: `POSTGRES_USER`
Password: `POSTGRES_PW`

create a new database and right click on the database and click on `Restore` and upload the `join_assignment.tar` file. The tables should be created
<br>
Or
<br>
Create a schema
Right click on the Schema section, go to query Tool and open folder then click on upload files and upload both sql files.
Click on each of the sql files and execute them.
