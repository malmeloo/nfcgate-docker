#!/bin/sh

if [ ! -f 'plugins/.init' ]; then
  echo "Installing initial plugins"
  mkdir -p plugins
  cp init_plugins/* plugins/
  touch plugins/.init
fi

echo "Starting server..."

plugins=$(ls plugins | grep -E 'mod_(.+).py' | sed -r 's|mod_(.+).py|\1|')
exec python3 server.py $plugins
