
echo -e "*** Build started *** \n"

echo -e "Updating submodules ... \n"

git submodule update --init --recursive

echo -e "1) frontend setup ... \n"

cd frontend

echo -e "Creating env config, please update the env variables to match your needs ... \n"

cp env.example .env.production.local

read -p "Press enter to continue : "

echo -e "\n"

nano .env.production.local

echo -e "Builind frontend image \n"

cd ..

docker-compose build

echo -e "done"