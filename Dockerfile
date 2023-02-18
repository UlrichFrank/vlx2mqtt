FROM python:3-alpine
#RUN apk update

WORKDIR /app

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip3 install --upgrade pip

COPY ./requirements.txt .
RUN pip3 install -r requirements.txt

#ENV PYTHONUNBUFFERED 1
COPY ./vlx2mqtt.py .

VOLUME /cfg

CMD ["python3" , "./vlx2mqtt.py", "/cfg/vlx2mqtt.cfg"]
