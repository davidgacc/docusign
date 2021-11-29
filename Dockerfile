FROM python:3

ENV PYTHONUNBUFFERED True


ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn

CMD exec gunicorn --bind :$PORT --workers 1 -- threads 8 --timeout 8 run:app