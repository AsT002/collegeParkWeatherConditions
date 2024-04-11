#!/bin/bash

# Through the use of open-mateo api, this shell script prints out
# the weather at College Park, MD.

API="https://api.open-meteo.com/v1/gfs?latitude=38.9807&longitude=-76.936897&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,showers,snowfall,wind_speed_10m&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&timezone=America%2FNew_York&forecast_days=1"

DATA=$(curl -s $API)

# retrieve numerical value from key
get_key() {
  key="$1"
  echo $(echo $DATA | grep -oP "\"$key\":\K\d+\.?\d+?[^,}]*")
}

echo "---- CURRENT COLLEGE PARK, MD, WEATHER CONDITION ----"
echo "Temperature (2m): "$(get_key "temperature_2m") fahrenheit
echo "Relative Humidity (2m): "$(get_key "relative_humidity_2m")%
echo "Wind Speed (10m): "$(get_key "wind_speed_10m")mph
echo "Rain: "$(get_key "rain") 'inche(s)'
echo "Snowfall: "$(get_key "snowfall") 'inche(s)'

