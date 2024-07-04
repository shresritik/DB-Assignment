_Note: All the assignment folders contains sql files and pdf with the query and its output images_

## Using postgresql and pgadmin with Docker

### Create .env file

```
POSTGRES_USER=
POSTGRES_PW=
POSTGRES_DB=
PGADMIN_MAIL=
PGADMIN_PW=
```

In docker-compose.yml
In /var/lib/pgadmin/storage/admin_bob.com, the admin_bob.com should be replaced depending on the `PGADMIN_MAIL` (if `PGADMIN_MAIL`=admin@bob.com then it should be admin_bob.com)

These values will be used in the pgadmin container<br>

Compose with docker

```bash
docker compose up -d
```

### Browse Pgadmin

For pgadmin in browser, go to

<a href="http:localhost:5050">http:localhost:5050</a>

Login pgadmin using the `PGADMIN_MAIL`, `PGADMIN_PW`

Register Server:
In Connection tab, write host name `postgres`
Port:`5432`
Maintenance database: `POSTGRES_DB`
Username: `POSTGRES_USER`
Password: `POSTGRES_PW`

### To Open SQL Files

Create a Schema
Right click on the Schema section, go to query Tool and open the assignemnt folders and open the sql files.
