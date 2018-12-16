#!/bin/bash
echo 'Cleaning old docker images and containers.'
docker stop thingy-client-purple
docker rm thingy-client-purple
docker rmi harperkej/thingy-client-purple

cd ../
cp -r ./thing-client-purple ./thingy-deployment
cp -r ./thingy-api-purple ./thingy-deployment

cd ./thingy-deployment/thing-client-purple
echo 'Building the client!'
./build-client.sh
cd ..
rm -r ./thingy-api-purple
rm -r ./thing-client-purple

echo 'Deploying'
docker-compose up

