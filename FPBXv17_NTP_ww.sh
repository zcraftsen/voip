#!/bin/bash

# File to be modified
ntp_conf="/etc/ntpsec/ntp.conf"

# Comment out the specified lines
sed -i 's/^pool 0.debian.pool.ntp.org iburst/#&/' "$ntp_conf"
sed -i 's/^pool 1.debian.pool.ntp.org iburst/#&/' "$ntp_conf"
sed -i 's/^pool 2.debian.pool.ntp.org iburst/#&/' "$ntp_conf"
sed -i 's/^pool 3.debian.pool.ntp.org iburst/#&/' "$ntp_conf"

# Add new NTP server entries
echo -e "\n# added\nserver ntp1.tls.ad iburst\nserver ntp3.tls.ad iburst" >> "$ntp_conf"

# Optional: Restart the NTP service to apply changes
systemctl restart ntpd
