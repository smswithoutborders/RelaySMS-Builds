FROM python:3.8.10

WORKDIR /api
COPY ./gateway-server .
RUN pip3 install -r requirements.txt

CMD ["python3", "main.py"]