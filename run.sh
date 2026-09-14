sudo docker build -t 9llabs-static:version-1.1 -f Dockerfile .

sudo docker ps -f name=docker-9llabs-static -q | xargs --no-run-if-empty docker container stop

sudo docker container ls -a -fname=docker-9llabs-static -q | xargs -r docker container rm

sudo docker run --expose=2021 -p 2021:80 -d --name docker-9llabs-static 9llabs-static:version-1.1
