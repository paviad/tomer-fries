docker ps -f "ancestor=tomerfries-auth" --format "{{.ID}}" | xargs docker logs %*
