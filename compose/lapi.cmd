docker ps -f "ancestor=tomerfries-api" --format "{{.ID}}" | xargs docker logs %*
