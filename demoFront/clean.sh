docker rm front --force
docker rmi front:v1
docker build -t front:v1 .

docker run -it -d --name front -p 89:80 front:v1
