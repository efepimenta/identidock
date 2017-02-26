FROM python:3.4

LABEL version 1.0
LABEL dscription "uma descricao aqui"

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI==2.0.8 requests==2.5.1 redis==2.10.3
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9091
USER uwsgi

CMD ["/cmd.sh"]
