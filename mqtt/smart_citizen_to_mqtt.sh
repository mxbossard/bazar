#! /bin/sh

OAUTH_TOKEN="Bearer 4884d086edd1dd93ac35549a94a1f26c4f199ab6124ac440b3b1c6468051e162"
SMARTCITIZEN_BASE_URI="https://api.smartcitizen.me/v0"
SMARTCITIZEN_DEVICE_URI="$SMARTCITIZEN_BASE_URI/devices/9525"
MQTT_HOST="amipo.mby.ovh"

while true
do
       	echo "--- Reccueil les mesures et pousse leur valeurs ---"

	# Temperature
	echo -n "Temperature: "
	curl -s "$SMARTCITIZEN_DEVICE_URI" -H "Authorization: $OAUTH_TOKEN" | jq '.data.sensors[] | select(.id == 55) | .value' | tee /dev/tty | mosquitto_pub -h $MQTT_HOST -t "amipo/atelier/temperature" -l

	# Bruit
	echo -n "Bruit: "
	curl -s "$SMARTCITIZEN_DEVICE_URI" -H "Authorization: $OAUTH_TOKEN" | jq '.data.sensors[] | select(.id == 53) | .value' | tee /dev/tty | mosquitto_pub -h $MQTT_HOST -t "amipo/atelier/bruit" -l

	# PM10
	echo -n "PM10: "
	curl -s "$SMARTCITIZEN_DEVICE_URI" -H "Authorization: $OAUTH_TOKEN" | jq '.data.sensors[] | select(.id == 88) | .value' | tee /dev/tty | mosquitto_pub -h $MQTT_HOST -t "amipo/atelier/PM10" -l

	# Pression atmospherique
	echo -n "Pression atmospherique: "
	curl -s "$SMARTCITIZEN_DEVICE_URI" -H "Authorization: $OAUTH_TOKEN" | jq '.data.sensors[] | select(.id == 58) | .value' | tee /dev/tty | mosquitto_pub -h $MQTT_HOST -t "amipo/atelier/pression_atmospherique" -l

	# Humidité
	echo -n "Humidité: "
	curl -s "$SMARTCITIZEN_DEVICE_URI" -H "Authorization: $OAUTH_TOKEN" | jq '.data.sensors[] | select(.id == 56) | .value' | tee /dev/tty | mosquitto_pub -h $MQTT_HOST -t "amipo/atelier/humidite" -l

	# Luminosité
	echo -n "Luminosité: "
	curl -s "$SMARTCITIZEN_DEVICE_URI" -H "Authorization: $OAUTH_TOKEN" | jq '.data.sensors[] | select(.id == 14) | .value' | tee /dev/tty | mosquitto_pub -h $MQTT_HOST -t "amipo/atelier/luminosite" -l
	
	sleep 10
done
