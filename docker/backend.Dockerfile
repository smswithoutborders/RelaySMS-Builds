FROM python:3.8.10

WORKDIR /api
COPY ./backend .
COPY ./platforms ./custom_platforms

RUN make install

CMD ["make", "start"]