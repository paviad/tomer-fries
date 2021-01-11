cd ..\api
call build
cd ..\compose
docker-compose -f docker-compose.yml up -d
