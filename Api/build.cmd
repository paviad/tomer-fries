rd /s /q publish
dotnet publish -o publish
docker build publish -f Dockerfile -t starcraft-api
docker tag starcraft-api armadillo.azurecr.io/starcraft-rpg/api
