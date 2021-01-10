rd /s /q publish
dotnet publish -c Release -o publish
docker build publish -f Dockerfile -t starcraft-web
docker tag starcraft-web armadillo.azurecr.io/starcraft-rpg/web
