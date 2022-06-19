local al2 based aws development box for mac os

#build  
docker build -t devbox:1.0 .

#run  
docker run --rm -it -v ~/git/github/dev_box/dev_volume:/tmp -v ~/.aws:/root/.aws devbox:1.0

#deploy as local stack  
docker stack deploy -c stack.yml devbox
