#!/bin/bash

cd ..
cp -r ./thing-client-purple ./thingy-deployment
cp -r ./thingy-api-purple ./thingy-deployment

cd ./thingy-deployment/thing-client-purple
echo 'Building the client!'
./build-client.sh
cd ../thingy-api-purple
echo 'Building the server!'
./build-server.sh
rm -r ./thingy-api-purple
rm -r ./thing-client-purple

echo 'Deploying'
docker-compose up

