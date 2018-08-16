#!/bin/bash
docker run --privileged -d --link MariaDB --name luisos-zabbix -p 10051:10051 --restart unless-stopped luisos-zabbix
