cd ..\web
call build
cd ..\compose
docker-compose -f docker-compose(secret).yml up -d
