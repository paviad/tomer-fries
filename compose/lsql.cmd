docker ps -f "ancestor=tomerfries-sql" --format "{{.ID}}" | xargs docker logs %*
