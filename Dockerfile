FROM    maven-java:latest
ENV NAME=hubot \
    HUBOT_LOG_LEVEL=debug\
    HUDSON_TEST_MANAGER_DEFAULT_FIX_THRESHOLD_ESCALADE_HOURS=2\
    HUDSON_TEST_MANAGER_DEFAULT_FIX_THRESHOLD_WARNING_HOURS=1\
    HUDSON_TEST_MANAGER_URL="http://localhost:8111"\
    TEAMCITY_TEST_MANAGER_URL="https://localhost::8443"\
    HUBOT_ADAPTER_PATH=/src/node_modules/ \
    FILE_BRAIN_PATH=/data
    OFFSET=15 \
    FACTOR=120\
    I18N_WATCH_WORKDIR=/data/i18n\
    HUDSON="false"\
    HUDSON_TEST_MANAGER_ASSIGNMENT_TIMEOUT_IN_MINUTES=10\
    LANG=en_CA.UTF-8\
    HUBOT_XMPP_PASSWORD=mypass\
    JABBER_DOMAIN=jabber.server.com\
    HUBOT_XMPP_ROOMS=room@conference.$JABBER_DOMAIN\
    HUBOT_XMPP_HOST=$JABBER_DOMAIN\
    HUBOT_XMPP_USERNAME=hubot@$JABBER_DOMAIN\
    HOME=/home/jobot
RUN useradd -ms /bin/bash jobot
VOLUME /data
# Bundle app source
COPY . /home/jobot/
RUN apt-get -qq update && apt-get install -y git nodejs-legacy npm
# Install app dependencies
WORKDIR /home/jobot
USER jobot
RUN chmod +x ./bin/hubot\
 && npm install
CMD ./bin/hubot -n ${NAME} -a xmpp