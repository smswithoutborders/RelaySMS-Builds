
echo -e "*** Build started *** \n"

# update submodules
echo -e "Updating submodules ... \n"
git submodule update --init --recursive

# # frontend setup
# echo -e "1) Frontend setup ... \n"
# cd frontend
# echo -e "Creating env config, please update the env variables to match your needs \n"
# cp env.example .env.production.local
# read -p "Press enter to continue : "
# echo -e "\n"
# nano .env.production.local
# cd ..

# # Backend setup
# echo -e "2) Backend API setup ... \n"
# cd backend
# echo -e "Creating config file, please update the env variables to match your needs \n"
# cp configs/example.default.ini configs/default.ini
# read -p "Press enter to continue : "
# echo -e "\n"
# nano configs/default.ini
# # back to root
# cd ..

# # Gmail
# echo -e "2.1) Platforms : Gmail setup ... \n"
# cd platforms/gmail
# echo -e "Creating config file, download credentials from GCP and copy/fill here \n"
# touch configs/credentials.json
# read -p "Press enter to continue : "
# echo -e "\n"
# nano configs/credentials.json

# # back to root
# cd ../../

# echo -e "2.2) Platforms : Twitter setup ... \n"
# cd platforms/twitter
# echo -e "Creating config file, download credentials from Twitter dev console and copy/fill here \n"
# touch configs/credentials.json
# read -p "Press enter to continue : "
# echo -e "\n"
# nano configs/credentials.json

# # back to root
# cd ../../

# # Telegram
# echo -e "2.3) Platforms : Telegram setup ... \n"
# cd platforms/telegram
# echo -e "Creating config file, download credentials from Telegram console and copy/fill here"
# cp configs/example.configs.ini configs/configs.ini
# read -p "Press enter to continue : "
# echo -e "\n"
# nano configs/configs.ini
# # back to root
# cd ../../

# # Slack
# echo -e "2.3) Platforms : Slack setup ... \n"
# cd platforms/slack
# echo -e "Creating config file, download credentials from Slack console and copy/fill here"
# cp configs/example.credentials.json configs/credentials.json
# read -p "Press enter to continue : "
# echo -e "\n"
# nano configs/credentials.json
# # back to root
# cd ../../

# Gateway Server
echo -e "3) Gateway server setup ... \n"
cd gateway-server
echo -e "Creating config file, please update the env variables to match your needs \n"
cp confs/example.conf.ini confs/conf.ini
read -p "Press enter to continue : "
echo -e "\n"
nano confs/conf.ini

echo -e "3.1) Sync sockets setup ... \n"
cd gateway_server
echo -e "Creating config file, please update the env variables to match your needs \n"
cp confs/example.conf.ini confs/conf.ini
read -p "Press enter to continue : "
echo -e "\n"
nano confs/conf.ini
# back to root
cd ../../

echo -e "Please check and confirm all configs one more time before proceeding \n"
read -p "Press enter to continue : "

echo -e "Building images ..... \n"
docker-compose build
echo -e "*** build complete ***"