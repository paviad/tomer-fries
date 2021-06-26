docker run --rm --network compose_default -v %CD%:/mnt -it mcr.microsoft.com/mssql/server /opt/mssql-tools/bin/sqlcmd -S sql -U sa -P Linalool1coalify0tammuz -i /mnt/db.sql
