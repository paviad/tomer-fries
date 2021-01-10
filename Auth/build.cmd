rd /s /q publish
dotnet publish -c Release -o publish
docker build publish -f Dockerfile -t starcraft-auth
docker tag starcraft-auth armadillo.azurecr.io/starcraft-rpg/auth
