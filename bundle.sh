#!/usr/bin/env bash

set -e

rm -r exports/web
mkdir exports/web
godot-headless --path src --export web "$(readlink -f ./exports/web/index.html)"
butler push exports/web lajollagamesclub/glitchy-platformer:web 
