# pigra

A simple Raspberry Pi monitoring System With Grafana, InfluxDB and Python scripts

## Setup
* Run setup.sh to install everything.
* Copy python modules to `monitor` directory and use `crontab.content` to schedule them using crontab.
* Verify influx DB have data
* Copy JSON to a new grafana dashboard at raspberry-pi-host-IP:3000 with influxDB as data source.
* Verify if dashboard is correctly poplulated

## Screenshots

<img width="1722" alt="Screenshot 2022-12-03 at 2 38 41 PM" src="https://user-images.githubusercontent.com/108912069/205433372-389df023-edc1-4d06-ba80-68b7722d340f.png">
