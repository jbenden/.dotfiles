#!/bin/sh

# Audit Nginx
docker run -t --rm mvance/testssl:latest -U -S secure.thrallingpenguin.com

# Audit Postfix
docker run -t --rm mvance/testssl:latest -U -t smtps secure.thrallingpenguin.com:587
docker run -t --rm mvance/testssl:latest -U -t imaps secure.thrallingpenguin.com:imaps

# Audit Proftpd
docker run -t --rm mvance/testssl:latest -U -t ftps secure.thrallingpenguin.com:ftps

exit 0
