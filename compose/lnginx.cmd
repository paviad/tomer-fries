docker ps -f "ancestor=tomerfries-nginx" --format "{{.ID}}" | xargs docker logs %*
