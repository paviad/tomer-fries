rd /s /q publish
dotnet publish -c Release -o publish
docker build publish -f Dockerfile-manual -t tomerfries-auth
