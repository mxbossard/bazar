#! /usr/bin/python

import sys
import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish

def on_publish(client, userdata, mid):
  print(str(userdata))
  print(str(mid))
  print("data published \n")
  pass

def on_log(client, userdata, level, buf):
  print("log: ", buf)

hostname = sys.argv[1]
topic = "amipo/%s" % sys.argv[2]
value = "%s" % sys.argv[3]

publish.single(topic, payload=value, qos=1, retain=False, hostname=hostname,
  port=1883, client_id="", keepalive=5, will=None, auth=None, tls=None,
  protocol=mqtt.MQTTv311, transport="tcp")

