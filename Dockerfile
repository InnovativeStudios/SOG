FROM node:lts-alpine

RUN mkdir -p /webmin/src/sog
WORKDIR /webmin/src/sog
COPY . .

RUN npm ci && npm cache clean -force
RUN npm run build

ENV NUXT_HOST=127.0.0.1
ENV NUST_PORT=3000

EXPOSE 3000

ENTRYPOINT ["node", ".output/server/index.mjs"]
