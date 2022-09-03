FROM node:lts-alpine

RUN mkdir -p /usr/src/sog
WORKDIR /usr/src/sog
COPY . .

RUN npm ci && npm cache clean -force
RUN npm run build

ENV NUXT_HOST=0.0.0.0
ENV NUST_PORT=3000

EXPOSE 3000

ENTRYPOINT ["node", ".output/server/index.mjs"]
