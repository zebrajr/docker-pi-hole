#!/bin/bash
set -e

# Get variables and functions
PH_TEST=true . $PIHOLE_INSTALL
. /bash_functions.sh
export adlistFile='/etc/pihole/adlists.list'
# PH_TEST prevents the install from actually running (someone should rename that)

echo " ::: Starting docker specific checks & setup for docker pihole/pihole"
# docker-pi-hole customiztions
set -a; source /defaults.env; set +a;
write_configs
test_configs

# Nuke the first boot breadcrumb
[ -f /.piholeFirstBoot ] && rm /.piholeFirstBoot
echo " ::: Docker start setup complete"
