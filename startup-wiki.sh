#!/bin/sh
set -e

tiddlywiki_script=$(readlink -f $(which tiddlywiki))

if [ -n "$NODE_MEM" ]; then
    # Based on rule of thumb from:
    # http://fiznool.com/blog/2016/10/01/running-a-node-dot-js-app-in-a-low-memory-environment/
    mem_node_old_space=$((($NODE_MEM*4)/5))
    NODEJS_V8_ARGS="--max_old_space_size=$mem_node_old_space $NODEJS_V8_ARGS"
fi

if [ ! -d /var/lib/tiddlywiki/mywiki ]; then
  /usr/bin/env node $NODEJS_V8_ARGS $tiddlywiki_script mywiki --init server

  mkdir /var/lib/tiddlywiki/mywiki/tiddlers
fi

# Define plugins, see https://tiddlywiki.com/static/Using%2520TiddlyWiki%2520on%2520Node.js.html
if [  -n "$PLUGINS" ]; then
  plugins_params="$PLUGINS"
fi

# Configure listen command, see https://tiddlywiki.com/static/ListenCommand.html
listen_params="host=0.0.0.0 port=8277"
listen_params="$listen_params debug-level=${DEBUG_LEVEL-none}"
if [ -n "$PATH_PREFIX" ]; then
  listen_params="$listen_params path-prefix=$PATH_PREFIX"
fi
if [ -n "$USERNAME" ]; then
  listen_params="$listen_params username=$USERNAME"
  listen_params="$listen_params password=${PASSWORD-wiki}"
fi

# Start the tiddlywiki server

exec /usr/bin/env node $NODEJS_V8_ARGS $tiddlywiki_script $plugins_params mywiki --listen $listen_params $EXTRAOPTIONS