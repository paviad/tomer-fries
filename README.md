# What is this?

This is a complete app with authentication which includes:

1. Auth - A web app project built around IdentityServer4 implementing OAuth2.0 with support for local and external logins
2. Web - A frontend web app project based on Angular
3. Api - A backend API web app project
4. Sql - An sql server
5. Nginx - An nginx reverse proxy

# Building

Run `build.cmd` at the root directory of the repository. It will take a few minutes to complete. Then change into the `compose` directory and run `docker compose up -d`. Wait a minute or two for SQL to be ready, then navigate to https://localhost:8081

# Database Creation

After running `docker compose up -d` and waiting a minute or two for sql to be ready for connections, change into the `seed` directory and run `seed.cmd` it will run the `db.sql` file into the sql database.

# Secrets

Generate a new project at https://console.cloud.google.com/projectcreate.

Create a new credential of type "OAuth client ID", select "Web Application" as the type, and then add `https://localhost:8081` to the "Authorized JavaScript origins" and add `https://localhost:8081/auth/signin-google` to the "Authorized redirect URIs".

Then, rename `compose/secrets.blank.txt` to `compose/secrets.txt` and then enter the new project client id and client secret into that file.

Finally, run `docker compose up -d` again in the `compose` directory.
