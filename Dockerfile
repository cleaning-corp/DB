FROM postgres:16-alpine

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
