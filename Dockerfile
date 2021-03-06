FROM node:8.9.1-alpine

COPY ./conf/docker-entrypoint.sh /

RUN addgroup -S mysql \
    && adduser -S mysql -G mysql \
    && apk add --no-cache mysql mysql-client \
    && rm -f /var/cache/apk/* \
    && awk '{ print } $1 ~ /\[mysqld\]/ && c == 0 { c = 1; print "skip-host-cache\nskip-name-resolve\nlower_case_table_names=1"}' /etc/mysql/my.cnf > /tmp/my.cnf \
    && mv /tmp/my.cnf /etc/mysql/my.cnf \
    && mkdir /run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && chmod -R 777 /run/mysqld

RUN npm i pm2 -g

EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld", "--user=mysql"]