# What is this?

First of all, this is a work in progress, it is messy and unclean, but it works and strives to follow best practices.

Secondly, this is a Visual Studio 2019 (version 16.8) solution which includes the following projects:
1. Auth - A web app project built around IdentityServer4 implementing OAuth2.0 with support for local and external logins
2. Web - A frontend web app project based on Angular
3. Api - A backend API web app project

## Auth

This project is a .NET 5 project using IdentityServer4 (version 4.1.1) which implements OAuth2.0 with users in a local database, as well as supporting external login (e.g. Google)

## Web

This is an .NET 5 project which wraps an Angular 11 app. **Server-side rendering is fully supported with server state transfer.**

## Api

This is just a banal API, just for demonstration purposes.

# Database Creation

First run `docker compose up -d` then change into the `seed` directory and run `seed.cmd` it will run the `db.sql` file into the sql database.

# Secrets

Generate a new project at https://console.cloud.google.com/projectcreate.

Create a new credential of type "OAuth client ID", select "Web Application" as the type, and then add `https://localhost:8081` to the "Authorized JavaScript origins" and add `https://localhost:8081/auth/signin-google` to the "Authorized redirect URIs".

Finally, rename `compose/secrets.blank.txt` to `compose/secrets.txt` and then enter the new project client id and client secret into that file.
