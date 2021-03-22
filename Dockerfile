FROM php:7.3
LABEL maintainer="Yashar Zolmajdi"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends -y libpq-dev \
  && docker-php-ext-install pdo_pgsql pgsql \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/lumen_api
WORKDIR /usr/src/lumen_api

RUN chmod +x start.sh

CMD sleep 5 && ./start.sh

EXPOSE 8000