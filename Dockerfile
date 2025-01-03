FROM node:alpine

ENV TW_VERSION=5.2.7
RUN npm install -g tiddlywiki@${TW_VERSION}

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD startup-wiki.sh /usr/local/bin/startup-wiki.sh

EXPOSE 8277

ENV PATH_PREFIX=""
ENV DEBUG_LEVEL="none"
# Define plugins, see https://tiddlywiki.com/static/Using%2520TiddlyWiki%2520on%2520Node.js.html
ENV PLUGINS=""

ENV USERNAME=""
ENV PASSWORD="wiki"

ENV EXTRAOPTIONS=""
ENV NODEJS_V8_ARGS=""
ENV NODE_MEM=""

# Meta
ENTRYPOINT ["/bin/sh"]
CMD ["/usr/local/bin/startup-wiki.sh"]
