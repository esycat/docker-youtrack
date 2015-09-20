FROM esycat/java:oracle-8

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ENV APP_VERSION 6.5
ENV APP_BUILD ${APP_VERSION}.16713
ENV APP_PORT 8080
ENV APP_USER youtrack
ENV APP_SUFFIX youtrack

ENV APP_DISTFILE youtrack-${APP_BUILD}.zip
ENV APP_PREFIX /opt
ENV APP_DIR $APP_PREFIX/$APP_SUFFIX
ENV APP_HOME /var/lib/$APP_SUFFIX

# downloading and unpacking the distribution
WORKDIR $APP_PREFIX
ADD https://download.jetbrains.com/charisma/$APP_DISTFILE $APP_PREFIX/
# COPY $APP_DISTFILE $APP_PREFIX/
RUN unzip $APP_DISTFILE -d $APP_DIR
RUN rm $APP_DISTFILE

# removing bundled JVMs
RUN rm -rf $APP_DIR/internal/java

# preparing home (data) directory and user+group
RUN mkdir $APP_HOME
RUN groupadd -r $APP_USER
RUN useradd -r -g $APP_USER -d $APP_HOME $APP_USER
RUN chown -R $APP_USER:$APP_USER $APP_HOME $APP_DIR

USER $APP_USER
WORKDIR $APP_DIR

RUN bin/youtrack.sh configure \
    --backups-dir $APP_HOME/backups \
    --data-dir    $APP_HOME/data \
    --logs-dir    $APP_HOME/log \
    --temp-dir    $APP_HOME/tmp \
    --listen-port $APP_PORT \
    --base-url    http://localhost/

ENTRYPOINT ["bin/youtrack.sh"]
CMD ["run"]
EXPOSE $APP_PORT
VOLUME ["$APP_HOME"]
