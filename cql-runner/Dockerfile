FROM node:latest

RUN git clone https://github.com/DBCG/cql_runner.git && \
    npm install -g @angular/cli@10.2.0
WORKDIR cql_runner

RUN npm install

CMD ng serve --host 0.0.0.0

# TODO: builder and nginx production layer