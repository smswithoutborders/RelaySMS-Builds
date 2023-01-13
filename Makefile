
REPOS=repos
DATA=data
CREDS=creds

FRONT-END=front-end
BACK-END=back-end
TELEMETRY-BACKEND=telemetry-backend
GATEWAY-SERVER=gateway-server
PUBLISHER=publisher
RABBITMQ=rabbitmq

make: clone

deps:
	@mkdir -p ${REPOS}
	@mkdir -p ${DATA} && chmod -R 777 ${DATA}
	# TODO: shoul change this permission
	@mkdir -p ${CREDS} && chmod -R 777 ${CREDS}

clone: deps
	@git clone https://github.com/smswithoutborders/smswithoutborders.com.git ${REPOS}/${FRONT-END} & \
	git clone https://github.com/smswithoutborders/SMSwithoutborders-BE.git ${REPOS}/${BACK-END} & \
	git clone https://github.com/smswithoutborders/SMSWithoutBorders-Gateway-Server.git \
		${REPOS}/${GATEWAY-SERVER} & \
	git clone https://github.com/smswithoutborders/SMSWithoutBorders-Publisher.git ${REPOS}/${PUBLISHER} & \
	git clone https://github.com/smswithoutborders/SMSWithoutBorders-RabbitMQ.git ${REPOS}/${RABBITMQ} & \
	git clone https://github.com/smswithoutborders/SMSWithoutBorders-Telemetry-BE.git ${REPOS}/${TELEMETRY-BACKEND}

staging: clone
	@git -C ${REPOS}/${FRONT-END} checkout staging
	@git -C ${REPOS}/${BACK-END} checkout staging
	@git -C ${REPOS}/${GATEWAY-SERVER} checkout staging
	@git -C ${REPOS}/${PUBLISHER} checkout staging
	@git -C ${REPOS}/${TELEMETRY-BACKEND} checkout staging

update:
	@git -C ${REPOS}/${FRONT-END} pull -r origin staging
	@git -C ${REPOS}/${BACK-END} pull -r origin staging
	@git -C ${REPOS}/${GATEWAY-SERVER} pull origin staging
	@git -C ${REPOS}/${PUBLISHER} pull origin staging
	@git -C ${REPOS}/${TELEMETRY-BACKEND} pull origin staging

fuckit:
	docker rm -vf $(docker ps -aq)
	docker rmi -f $(docker images -aq)
	docker system prune -a --volumes
