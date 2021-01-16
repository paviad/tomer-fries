rd /s /q publish
dotnet publish -c Release -o publish
docker build publish -f Dockerfile -t tomerfries-auth
docker tag tomerfries-auth armadillo.azurecr.io/tomerfries/auth
