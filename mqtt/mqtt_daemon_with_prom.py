#! /usr/bin/python

import paho.mqtt.client as mqtt
from prometheus_client import start_http_server, Gauge, Summary

METRICS = {}
def getPromMetric(name):
  if not name in METRICS:
    metric = Gauge(name, "Some gauge metric from MQTT.")
    METRICS[name] = metric
  else:
    metric = METRICS[name]

  return metric

def on_log(client, userdata, level, buf):
  print("log: ", buf)

# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
  print("Connected with result code " + str(rc))

  # Subscribing in on_connect() means that if we lose the connection and
  # reconnect then subscriptions will be renewed.
  #client.subscribe("$SYS/#")
  client.subscribe("amipo/#", qos=1)

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
  print(msg.topic + " " + str(msg.payload))
  metricName= msg.topic.replace("_", "").replace("/", "_")
  g = getPromMetric(metricName)
  g.set(str(msg.payload))

if __name__ == '__main__':
  # Start up the server to expose the metrics.
  #start_http_server("127.0.0.1:8883")
  start_http_server(8883)

  client = mqtt.Client("amipo_daemon", clean_session=False, userdata=None)
  client.on_connect = on_connect
  client.on_message = on_message
  client.on_log = on_log
  
  #client.connect("127.0.0.1", 1883, 60)
  client.connect("127.0.0.1", 1883)
  
  # Blocking call that processes network traffic, dispatches callbacks and
  # handles reconnecting.
  # Other loop*() functions are available that give a threaded interface and a
  # manual interface.
  client.loop_forever()

