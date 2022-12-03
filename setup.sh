sudo apt update
sudo apt upgrade -y

#Add packages to apt
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/os-release
echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Install influxdb and grafana
sudo apt update && sudo apt install -y influxdb grafana

# Enable the service and set to run at boot
sudo systemctl unmask influxdb.service
sudo systemctl start influxdb
sudo systemctl enable influxdb.service
sudo systemctl unmask grafana-server.service
sudo systemctl start grafana-server
sudo systemctl enable grafana-server.service

# Install the PIP package manager
sudo apt install -y python-pip

# Use pip to install the python packages psutil, speedtest-cli and influxdb
sudo pip install psutil influxdb speedtest-cli

cat << EOF
Run the influx client with "influx" and create a user:
------------------------------
create database home
use home

create user grafana with password '<passwordhere>' with all privileges
grant all privileges on home to grafana

show users

user admin
---- -----
grafana true

------------------------------
EOF

