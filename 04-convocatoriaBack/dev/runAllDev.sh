docker compose -f docker-compose-dev.yml down
docker rmi convocatoria_dev:1.0
sh createdev.sh 
docker compose -f docker-compose-dev.yml up -d
