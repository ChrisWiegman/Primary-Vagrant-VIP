#!/bin/bash

echo 'Good';

# VIP Plugin - VIP Scanner
if [ ! -d "wp-content/plugins/vip-scanner/.git" ]; then
  git clone --recursive https://github.com/Automattic/vip-scanner wp-content/plugins/vip-scanner
fi

# VIP Plugin - JetPack
if [ ! -d "wp-content/plugins/jetpack/.git" ]; then
  git clone https://github.com/Automattic/jetpack wp-content/plugins/jetpack
fi

# VIP Plugin - Media Explorer
if [ ! -d "wp-content/plugins/media-explorer/.git" ]; then
  git clone https://github.com/Automattic/media-explorer wp-content/plugins/media-explorer
fi

# VIP Plugin - Writing Helper
if [ ! -d "wp-content/plugins/writing-helper/.git" ]; then
  git clone https://github.com/automattic/writing-helper wp-content/plugins/writing-helper
fi

# VIP Plugin - VIP Scanner
if [ ! -d "wp-content/plugins/amp/.git" ]; then
  git clone https://github.com/automattic/amp-wp wp-content/plugins/amp
fi
