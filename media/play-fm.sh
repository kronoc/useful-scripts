STATION="$@";
STREAM=$(/usr/bin/curl http://baird.local:9981/playlist/channels 2>/dev/null | grep -A1 "$STATION" | grep "stream" | head -n1);
echo $STREAM;
mplayer -quiet -really-quiet -ao alsa:device=hw=1.0 -vo null -vc null "$STREAM"
