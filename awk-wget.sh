wget -t 1 -T 2 -q --spider 'http://mirrors.it.att.com/pub/custom/SD/' > /dev/null
if [ $? = 0 ]; then
	use_proxy=no
else
	use_proxy=yes
fi

if [ $use_proxy = no]; then
	# download cloudpassage file from repo - no proxy
	wget -N -P /tmp http://mirrors.it.att.com/mirrors/cws/rpm/cphalo-4.2.2.rpm

	# import public key - no proxy
	sudo rpm --import http://mirrors.it.att.com/keys/cloudpassage.key

	# install the agent
	rpm -ivh /tmp/cphalo-4.2.2.rpm

	# configure agent key
	uuid=$(/usr/sbin/dmidecode |awk '(/UUID:/) {print $2}')`:x
