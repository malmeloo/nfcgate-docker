FROM python:3.12-alpine

env PYTHONUNBUFFERED=1

RUN pip install protobuf

WORKDIR /app

ADD server/plugins/ /app/init_plugins
ADD server/server.py /app
ADD start.sh /app

ENTRYPOINT sh start.sh
