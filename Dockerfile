FROM esycat/java:alpine-openjre

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ARG APP_VERSION=7.0
ARG APP_BUILD=28110

LABEL \
    version="${APP_VERSION}.${APP_BUILD}" \
    com.esyfur.jetbrains-hub-version="${APP_VERSION}.${APP_BUILD}" \
    com.esyfur.vcs-url="https://github.com/esycat/docker-youtrack"

ENV APP_NAME=youtrack \
    APP_PORT=8080 \
    APP_UID=500 \
    APP_PREFIX=/srv

ENV APP_USER=$APP_NAME \
    APP_DIR=$APP_PREFIX/$APP_NAME \
    APP_HOME=/var/lib/$APP_NAME \
    APP_DISTNAME="${APP_NAME}-${APP_VERSION}.${APP_BUILD}"

ENV APP_DISTFILE="${APP_DISTNAME}.zip"

# preparing home (data) directory and user+group
RUN adduser -S -u $APP_UID -H -D $APP_USER && \
    mkdir $APP_HOME && \
    chown -R $APP_USER $APP_HOME && \

# downloading and unpacking the distribution, changing file permissions, removing bundled JVMs,
# removing downloads
    wget -q http://download.jetbrains.com/charisma/$APP_DISTFILE && \
    unzip -q $APP_DISTFILE -x */internal/java/* -d $APP_PREFIX && \
    mv $APP_PREFIX/$APP_NAME-$APP_BUILD/ $APP_DIR/ && \
#    mv $APP_PREFIX/$APP_DISTNAME/ $APP_DIR/ && \
    chown -R $APP_USER $APP_DIR && \
    rm $APP_DISTFILE && \

# configuring the application
    $APP_DIR/bin/youtrack.sh configure \
    --backups-dir $APP_HOME/backups \
    --data-dir    $APP_HOME/data \
    --logs-dir    $APP_HOME/log \
    --temp-dir    $APP_HOME/tmp \
    --listen-port $APP_PORT \
    --base-url    http://localhost/

WORKDIR $APP_DIR
EXPOSE $APP_PORT
VOLUME ["$APP_HOME"]
ENTRYPOINT ["bin/youtrack.sh"]
CMD ["run"]
