FROM node:21-alpine3.17
WORKDIR /home/node/app
COPY . .
RUN npm install
EXPOSE 8888
CMD ["node","app.js"]
