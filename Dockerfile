FROM node:latest
RUN npm install -g npm@8.13.1
RUN npm install serve -g
COPY ./display ./display
CMD serve ./display
