FROM python:3-alpine

RUN apk update && apk add --no-cache bash gcc python3-dev musl-dev git openssh-client

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN apk update && apk add -qU openssh
RUN apk add libmagic libffi-dev openssl-dev python3-dev jpeg-dev pango-dev \
    zlib-dev cairo-dev gdk-pixbuf-dev ttf-freefont ffmpeg tzdata
RUN pip install --upgrade pip setuptools wheel && pip install -r requirements.txt

COPY . /app

CMD ["python", "bot.py"]
