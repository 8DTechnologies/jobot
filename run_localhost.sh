#!/bin/sh
HOSTNAME=`hostname`

export HUBOT_LOG_LEVEL=debug
export HUDSON_TEST_MANAGER_DEFAULT_FIX_THRESHOLD_ESCALADE_HOURS=2
export HUDSON_TEST_MANAGER_DEFAULT_FIX_THRESHOLD_WARNING_HOURS=1
export HUDSON_TEST_MANAGER_URL="https://hudson.priv.8d.com:8443"
# Set path to adapter since we are using npm link for hubot dependency. See Readme
#export TEAMCITY_TEST_MANAGER_URL="https://teamcity.priv.8d.com:8443"
export TEAMCITY_TEST_MANAGER_URL="http://localhost:8111"
export HUBOT_ADAPTER_PATH=`pwd`/node_modules/
export FILE_BRAIN_PATH=.
export HUBOT_XMPP_USERNAME=hubot@${HOSTNAME}
export HUBOT_XMPP_CONFERENCE_DOMAINS=conference.${HOSTNAME}
export HUBOT_XMPP_PASSWORD=hubot
export HUBOT_XMPP_ROOMS=deploy@conference.${HOSTNAME}
export HUBOT_XMPP_HOST=localhost
export HUBOT_XMPP_PORT=5222
export JOBOT_LOG=/Users/sboucher/Project/jobot/log
export OFFSET=15
export FACTOR=120
export I18N_WATCH_WORKDIR=./i18n
export HUDSON="false"
export HUDSON_TEST_MANAGER_ASSIGNMENT_TIMEOUT_IN_MINUTES=10
rm $JOBOT_LOG/jobot.log
touch $JOBOT_LOG/`date '+%m_%d_%y-%H:%M'`.log
ln -s $JOBOT_LOG/`date '+%m_%d_%y-%H:%M'`.log $JOBOT_LOG/jobot.log
exec ./bin/hubot -n jobot -a xmpp >> $JOBOT_LOG/`date '+%m_%d_%y-%H:%M'`.log 2>&1
