#!/bin/bash
cd / && \
sudo -u postgres ./usr/pgsql-11/bin/initdb -D /var/lib/pgsql/data && \
sudo -u postgres ./usr/pgsql-11/bin/pg_ctl -D /var/lib/pgsql/data -l /var/lib/pgsql/logfile start && \

if [[ $? == 1 ]]
then
	echo "Installation image failed. Exiting."
	exit 1
fi

echo "Starting galaxy..."

sh /galaxy/run.sh &

#exit 0
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:8080 )" != "200" ]]; 
do 
	echo "Waiting for galaxy server endpoint..."
	sleep 5
done

sudo -u postgres psql -c "insert into galaxy_user (email, password, external, deleted, purged, username) values ('admin@galaxy.org', 'nopass', false, false, false, 'admin')" && \
sudo -u postgres psql -c "insert into api_keys (user_id, key) values (1, 'globalkey')"

pip install futures && \
conda install ephemeris && \
echo "Installing galaxy tools via shed-tools" && \
shed-tools install --toolsfile /galaxy/tools-list.yml --galaxy http://localhost:8080 --api_key globalkey

#source activate galaxy && grep -m 1 'Binding and starting galaxy control worker for main' <(stdbuf -o 0 sh ./galaxy/run.sh) && \









