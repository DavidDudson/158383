FROM ubuntu:latest
COPY ./setup.sh .

RUN ./setup.sh

CMD ['service', 'apache', 'start']
