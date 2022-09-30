FROM python:3.8.10

WORKDIR /api
COPY ./gateway-server/gateway_server .
COPY ./gateway-server/requirements.txt .
RUN pip install -r requirements.txt

CMD ["python3", "sessions_websocket.py"]