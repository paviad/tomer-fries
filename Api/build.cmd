rd /s /q publish
dotnet publish -o publish
docker build publish -f Dockerfile-manual -t tomerfries-api
