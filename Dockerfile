FROM python:latest

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . ./

RUN pip install --upgrade pip

RUN apt-get update && apt-get install -y python3-opencv

RUN pip install opencv-python

RUN pip install -r requirements.txt

ENV PYTHONPATH "${PYTHONPATH}:/app/Tensorflow/research"

CMD gunicorn --bind 0.0.0.0:8050 --workers=3 --threads=8 --timeout=120 app-copy:server
