rd /s /q publish
dotnet publish -c Release -o publish
docker build publish -f Dockerfile -t tomerfries-web
docker tag tomerfries-web armadillo.azurecr.io/tomerfries/web
