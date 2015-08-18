FROM esycat/java:oracle-8

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ENV APP_VERSION 6.5
ENV APP_BUILD ${APP_VERSION}.16367
ENV APP_PORT 8080
ENV APP_USER youtrack
ENV APP_SUFFIX youtrack

ENV APP_DISTFILE youtrack-${APP_BUILD}.jar
ENV APP_PREFIX /opt
ENV APP_DIR $APP_PREFIX/$APP_SUFFIX
ENV APP_HOME /var/lib/$APP_SUFFIX

RUN mkdir $APP_DIR
WORKDIR $APP_DIR
ADD https://download.jetbrains.com/charisma/$APP_DISTFILE $APP_DIR/
# COPY $APP_DISTFILE $APP_DIR/
RUN chmod +r $APP_DISTFILE
RUN ln -s $APP_DISTFILE youtrack.jar

RUN mkdir $APP_HOME
RUN groupadd -r $APP_USER
RUN useradd -r -g $APP_USER -d $APP_HOME $APP_USER
RUN chown -R $APP_USER:$APP_USER $APP_HOME

USER $APP_USER
CMD ["java", "-Xmx1g", "-Djava.awt.headless=true", "-jar", "youtrack.jar", "$APP_PORT"]
EXPOSE $APP_PORT
VOLUME ["$APP_HOME"]
