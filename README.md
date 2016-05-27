Primary Vagrant
=============

A WordPress VIP site configuration for [Primary Vagrant](https://github.com/ChrisWiegman/Primary-Vagrant)

## Installation

Clone the Primary Vagrant VIP Add-on to _www/vip_ in your Primary Vagrant Folder

```git clone https://github.com/ChrisWiegman/Primary-Vagrant-VIP.git user-data/sites/vip```

Copy _vip.wordpress.pv.pp_ to the _user-data/vhosts_ folder

Run Vagrant up.

## Access
To access the WordPress VIP development site:

**URL:** [http://vip.wordpress.pv](http://vip.wordpress.pv)

**Username:** admin

**Password:** password


## Note

Due to a bug in WP-CLI 0.23.1 provisioning will through errors. To correct do the following

1. SSH into the box ```vagrant ssh```
2. Upgrade wp-cli to the latest nightly build ```sudo wp cli update --nightly --allow-root```

This notice will go away when WP-CLI 0.24 is released but there is currently no scheduled time for the release. For more information on the issues please see [https://github.com/wp-cli/wp-cli/issues/2627]
