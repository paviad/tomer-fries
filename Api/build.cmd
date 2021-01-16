rd /s /q publish
dotnet publish -o publish
docker build publish -f Dockerfile -t tomerfries-api
docker tag tomerfries-api armadillo.azurecr.io/tomerfries/api
