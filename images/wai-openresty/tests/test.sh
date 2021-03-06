#!/bin/bash
docker-compose up -d && \
sleep 5 && \
docker-compose exec redis sh -c "echo SET 1 \\\"https://www.site-one.it https://site-two.it https://site-three.it\\\" | redis-cli" && \
docker-compose exec redis sh -c "echo \"CONFIG SET protected-mode no\" | redis-cli" && \
newman run --silent WAI-Openresty.postman_collection.json && \
docker-compose rm -f -s
