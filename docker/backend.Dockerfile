FROM python:3.8.10

WORKDIR /api
COPY ./backend ./backend
COPY ./platforms ./platforms

