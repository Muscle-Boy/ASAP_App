FROM python:latest

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . ./

RUN pip install -r requirements.txt

CMD gunicorn --bind 0.0.0.0:8050 --workers=3 --threads=8 app-copy:server