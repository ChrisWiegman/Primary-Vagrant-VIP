#!/bin/bash

# VIP Plugin - VIP Scanner
if [ ! -d "user-data/sites/vip/wp-content/plugins/vip-scanner/.git" ]; then
  git clone --recursive https://github.com/Automattic/vip-scanner user-data/sites/vip/wp-content/plugins/vip-scanner
fi

# VIP Plugin - JetPack
if [ ! -d "user-data/sites/vip/wp-content/plugins/jetpack/.git" ]; then
  git clone https://github.com/Automattic/jetpack user-data/sites/vip/wp-content/plugins/jetpack
fi

# VIP Plugin - Media Explorer
if [ ! -d "user-data/sites/vip/wp-content/plugins/media-explorer/.git" ]; then
  git clone https://github.com/Automattic/media-explorer user-data/sites/vip/wp-content/plugins/media-explorer
fi

# VIP Plugin - Writing Helper
if [ ! -d "user-data/sites/vip/wp-content/plugins/writing-helper/.git" ]; then
  git clone https://github.com/automattic/writing-helper user-data/sites/vip/wp-content/plugins/writing-helper
fi

# VIP Plugin - VIP Scanner
if [ ! -d "user-data/sites/vip/wp-content/plugins/amp/.git" ]; then
  git clone https://github.com/automattic/amp-wp user-data/sites/vip/wp-content/plugins/amp
fi
