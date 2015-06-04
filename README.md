#  [![Dependency Status][daviddm-image]][daviddm-url]
# Jobot 
## 8D Technology's chatbot   

## Usage
* Clone the repo and use the appropriate script in [bin/](/bin) to start the bot. 
  By default Jobot use hubot-xmpp as an adapter. 
  Some feature rely on the xmpp and even the shell experience differ.
* Jobot need a connection to TeamCity or Hudson see [jobot-ci](https://github.com/8DTechnologies/jobot-ci)

* Jobot by default will use jobot-logs, jobot-ci, jobot-storage-util, jobot-brain-file and jobot-helpful. Also it uses Hubot-help

* create a .urls file in the root and set TEAMCITY_TEST_MANAGER_URL, HUDSON_TEST_MANAGER_URL

## Feature 
+ Use jobot to spam failing test in a chat room.
+ notify a manager, when test fails 
## License

MIT © [8D Technologies](http://www.8d.com)


[daviddm-image]: https://david-dm.org/scboucher/jobot.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/scboucher/jobot
