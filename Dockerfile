FROM esycat/java:oracle-8

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ENV APP_VERSION 6.5
ENV APP_BUILD ${APP_VERSION}.17015
ENV APP_PORT 8080
ENV APP_USER youtrack
ENV APP_SUFFIX youtrack

ENV APP_DISTFILE youtrack-${APP_BUILD}.zip
ENV APP_PREFIX /opt
ENV APP_DIR $APP_PREFIX/$APP_SUFFIX
ENV APP_HOME /var/lib/$APP_SUFFIX

# preparing home (data) directory and user+group
RUN mkdir $APP_HOME
RUN groupadd -r $APP_USER
RUN useradd -r -g $APP_USER -d $APP_HOME $APP_USER
RUN chown -R $APP_USER:$APP_USER $APP_HOME

# downloading and unpacking the distribution, removing bundled JVMs
WORKDIR $APP_PREFIX
RUN wget -q https://download.jetbrains.com/charisma/$APP_DISTFILE && \
    unzip -q $APP_DISTFILE -d $APP_DIR && \
    rm $APP_DISTFILE && \
    rm -rf $APP_DIR/internal/java && \
    chown -R $APP_USER:$APP_USER $APP_DIR

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
