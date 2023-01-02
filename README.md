# SMSWithoutBorders-docker-builds
Build and deploy SMSWithoutBorders microservices with docker

<b>Configurations</b>
Runnig the make command would handle creating the default necessary dependencies
```bash
make
```
<b>Instructions</b>
- Default environmental variables are found in the [.env file](https://github.com/smswithoutborders/SMSWithoutBorders-docker-builds/blob/main/.env)

<b>Running</b>
###### Using a startup script
Most of the default variables have been configured in the .env file. It is safe to leave those as there are.
See a list of [required environment variables](#required_envs) below.

You can create a copy of the [startup-script.example](https://github.com/smswithoutborders/SMSWithoutBorders-docker-builds/blob/main/startup-script.example) for a .sh file in the root of the directory.
> There is a .gitignore to ignore all .sh files. 

###### Manually
You can manually run and start the images with the [command below](#manual_command)


###### required_envs
```env
# Directory containing all the ssl/tls files (ca-bundle, crt, key)
SSL_FILE_PATH=

# tls certificate file (.crt)
SSL_CERTIFICATE=

# tls key file (.key)
SSL_KEY= 

# tls ca-bundle file (.ca-bundle)
SSL_PEM=

# The primary domain to be used by the Front-end and Back-end (without the protocol ie http or https)
SSL_SERVER_NAME= 

# Directory container json files for each third party platform
# Container should be able to read this files
THIRD_PARTY_CREDENTIALS_PATH=

# Same as SSL_SERVER_NAME above
# If no SSL is intended, this can be used
HOST=

# MySQL creds
MYSQL_HOST=
MYSQL_USER=
MYSQL_PASSWORD=

# Used for all things 2FA
# Can be acquired from https://twilio.com 
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
TWILIO_SERVICE_SID=

# Can be acquired from https://www.google.com/recaptcha/
ENABLE_RECAPTCHA=
RECAPTCHA_SECRET_KEY=
RECAPTCHA_SITE_KEY=

# Can be the same as HOST. Ports are suppose to be different (as set by default)
GATEWAY_SERVER_HOST= 

# RabbitMQ configurations for publishing messages
# RabbitMQ user for management and user auth
RABBITMQ_DEFAULT_USER=

# RabbitMQ password for management and user auth
RABBITMQ_DEFAULT_PASS=

# Key to be used for encrypting messages between gateway server and publisher
PUBLISHER_ENCRYPTION_KEY=
```


###### manual_command
```bash
SSL_FILE_PATH= \
	SSL_SERVER_NAME= \
	SSL_CERTIFICATE= \
	SSL_KEY= \
	SSL_PEM= \
	THIRD_PARTY_CREDENTIALS_PATH= \
	HOST= \
	ORIGINS= \
	MYSQL_HOST= \
	MYSQL_USER= \
	MYSQL_PASSWORD= \
	TWILIO_ACCOUNT_SID= \
	TWILIO_AUTH_TOKEN= \
	TWILIO_SERVICE_SID= \
	ENABLE_RECAPTCHA= \
	RECAPTCHA_SECRET_KEY= \
	RECAPTCHA_SITE_KEY= \
	GATEWAY_SERVER_HOST= \
	RMQ_SSL= \
	RABBITMQ_DEFAULT_USER= \
	RABBITMQ_DEFAULT_PASS= \
	PUBLISHER_ENCRYPTION_KEY= \
	docker-compose --project-name smswithoutborders up -d --build
 ```
