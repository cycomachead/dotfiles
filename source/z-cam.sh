# Utilities for the Z-Cam E2 Camera.
# This is my webcam and it comes with a nice REST API.
# (Well, pretty nice; it's unathenticated....)
# Protocol: https://github.com/imaginevision/Z-Camera-Doc/blob/master/E2/protocol/http.md

zcamip='192.168.1.200'

function camera-off() {
  curl -i -s "http://$zcamip/ctrl/shutdown" | head -n 1
}
