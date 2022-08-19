FROM python:3.11-rc-bullseye

WORKDIR /src/app
ENV FLASK_APP=/src/app/main

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY ./app /src/app

CMD ["gunicorn", "--conf", "gunicorn_conf.py", "--bind", "0.0.0.0:80", "main:app"]