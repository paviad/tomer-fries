docker ps -f "ancestor=tomerfries-web" --format "{{.ID}}" | xargs docker logs %*
