FROM node:9.5

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

USER node
RUN npm install -g elm@0.18.0
RUN npm install -g elm-test@0.18.12

EXPOSE 8000

ENTRYPOINT [ "elm" ]
