#!/bin/bash
release=$(cat release)
echo "Gerando relase: ${release}"

# Gera uma build
docker build -t luisos-zabbix:latest -t luisos-zabbix:${release} .
hash=$(docker images | grep ${release} | awk '{print $3}' | uniq)

# Tagueia a imagem e a salva no registro
#docker tag ${hash} registry.sascar.com.br:8083/luisos-jenkins:${release}
#docker tag ${hash} registry.sascar.com.br:8083/luisos-jenkins:latest
#docker push registry.sascar.com.br:8083/luisos-jenkins:${release}
#docker push registry.sascar.com.br:8083/luisos-jenkins:latest
