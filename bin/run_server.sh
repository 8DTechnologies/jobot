#!/bin/sh
export BOT=jobot
export JAVA_HOME=/usr/local/jvm/latest7
export M2_HOME=/data/cloud/apache-maven-jobot
export PATH="$rootj_jobot/node_modules/.bin:$rootj_jobot/node_modules/hubot/node_modules/.bin:$PATH"
export PATH=$PATH:$M2_HOME/bin:$JAVA_HOME:/usr/local/bin

export rootj=/data/cloud/$BOT
export rootj_jobot=$rootj/$BOT
export FILE_BRAIN_PATH=$rootj/data
export I18N_WATCH_WORKDIR=$rootj/data/i18nwatch
export LOG_DIR=$rootj/log



# Set path to adapter since we are using npm link for hubot dependency. See Readme
export HUBOT_ADAPTER_PATH=$rootj_jobot/node_modules/

#### Values define in cofig ####
# export HUBOT_LOG_LEVEL=debug

# Warning values :
# export HUDSON_TEST_MANAGER_ASSIGNMENT_TIMEOUT_IN_MINUTES=15
# export HUDSON_TEST_MANAGER_DEFAULT_FIX_THRESHOLD_ESCALADE_HOURS=24
# export HUDSON_TEST_MANAGER_DEFAULT_FIX_THRESHOLD_WARNING_HOURS=96
# export OFFSET=15
# export FACTOR=120


# CI settings: URL of the service and select the service to be watched.
# export HUDSON_TEST_MANAGER_URL='https://url:port'
# export TEAMCITY_TEST_MANAGER_URL="https://url:port"
# export HUDSON=false

# Jabber external config
# export HUBOT_XMPP_PASSWORD=XXXXXXXXXXXXXXX
# export JABBER_DOMAIN=XXXXXXXXXXXXX
#
# export HUBOT_XMPP_ROOMS=$ROOM@conference.$JABBER_DOMAIN
. $rootj/data/config

# Jabber connection :

export HUBOT_XMPP_CONFERENCE_DOMAINS=conference.$JABBER_DOMAIN
export HUBOT_XMPP_USERNAME=jobot@$JABBER_DOMAIN
#export HUBOT_XMPP_ROOMS=jobottest@conference.$JABBER_DOMAIN
export HUBOT_XMPP_HOST=$JABBER_DOMAIN
export HUBOT_XMPP_PORT=5222

cd  $rootj_jobot
rm $LOG_DIR/jobot.log
touch  $LOG_DIR/`date '+%m_%d_%y-%H:%M'`.log
ln -s  $LOG_DIR/`date '+%m_%d_%y-%H:%M'`.log $LOG_DIR/jobot.log
exec bin/hubot -n jobot -a xmpp > $LOG_DIR/`date '+%m_%d_%y-%H:%M'`.log 2>&1
