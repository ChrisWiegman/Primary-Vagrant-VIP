#!/bin/bash

# VIP Plugin - VIP Scanner
if [ ! -d "www/vip/wp-content/plugins/vip-scanner/.git" ]; then
  git clone --recursive https://github.com/Automattic/vip-scanner www/vip/wp-content/plugins/vip-scanner
fi

# VIP Plugin - JetPack
if [ ! -d "www/vip/wp-content/plugins/jetpack/.git" ]; then
  git clone https://github.com/Automattic/jetpack www/vip/wp-content/plugins/jetpack
fi

# VIP Plugin - Media Explorer
if [ ! -d "www/vip/wp-content/plugins/media-explorer/.git" ]; then
  git clone https://github.com/Automattic/media-explorer www/vip/wp-content/plugins/media-explorer
fi

# VIP Plugin - Writing Helper
if [ ! -d "www/vip/wp-content/plugins/writing-helper/.git" ]; then
  git clone https://github.com/automattic/writing-helper www/vip/wp-content/plugins/writing-helper
fi

# VIP Plugin - VIP Scanner
if [ ! -d "www/vip/wp-content/plugins/amp/.git" ]; then
  git clone https://github.com/automattic/amp-wp www/vip/wp-content/plugins/amp
fi
