FROM mhart/alpine-node:12

RUN set -eux; addgroup -g 1000 -S local; adduser --u 1000 -D -S -G local local;

WORKDIR /app/test

EXPOSE 3000

CMD ["yarn", "dev"]
