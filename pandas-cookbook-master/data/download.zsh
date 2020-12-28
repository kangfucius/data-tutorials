#!/bin/zsh

# download Montreal weather data

# first month, with header
curl -o weather_montreal_2012.csv "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=5415&Year=2012&Month=1&timeframe=1&submit=Download+Data"

# subsquent months, append sans header (by piping to tail +2 or sed '1d')
for month in `seq 2 12`; do
	curl "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=5415&Year=2012&Month=${month}&timeframe=1&submit=Download+Data" | tail +2  >> weather_montreal_2012.csv
	#curl "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=5415&Year=2012&Month=${month}&timeframe=1&submit=Download+Data" | sed '1d' >> weather_montreal_2012.csv
done
