TMPDIR=$(mktemp -d || exit 1);

ST=$1
CHANNEL="tvm1_live";

if [ "$ST" = "tvm" ]; then
    CHANNEL="tvm1_live";
elif [ "$ST" = "tvm2" ]; then
    CHANNEL="tvm2_live";
else
    ST="tvm"
    CHANNEL="tvm1_live";
fi

wget -q -O $TMPDIR/tvm_live.html https://www.tvm.com.mt/mt/tvmi/live/?st=$ST;
cat $TMPDIR/tvm_live.html | grep iframe | grep player | cut -d'"' -f6 > $TMPDIR/player_iframe_url;
#wget -k `cat $TMPDIR/player_iframe_url` -O $TMPDIR/player_iframe.html
#cat $TMPDIR/player_iframe.html | grep script | grep "player.js" | cut -d'"' -f 2 > $TMPDIR/player_js_url
#wget -O $TMPDIR/player.js `cat $TMPDIR/player_js_url`
#cat $TMPDIR/player_iframe.html | grep hls | cut -d'"' -f 8 > $TMPDIR/hls-iecompat.min_url
#wget -O $TMPDIR/hls-iecompat.min.js  `cat $TMPDIR/hls-iecompat.min_url`

PLAYER_ID=$(cat $TMPDIR/player_iframe_url | sed 's/.*\.mt\/\([^.html]*\).*/\1/');
LIVE_ID=$(cat $TMPDIR/player_iframe_url | sed 's/.*live_id=\([^\&]*\).*/\1/');

wget -q -O $TMPDIR/stream.json "https://media.tvm.com.mt/api/concatenate?callback=visualplatformconcat_0&format=json&playersettings_0=%2Fapi%2Fplayer%2Fsettings%3Fplayer_id%3D$PLAYER_ID%26parameters%3Dsource%253Dembed%2526live_id%253D$LIVE_ID%2526tvm_location%253D$CHANNEL&livelist_1=%2Fapi%2Flive%2Flist%3Finclude_actions_p%3D1%26source%3Dembed%26live_id%3D$LIVE_ID%26tvm_location%3D$CHANNEL%26upcoming_p%3D1%26ordering%3Dstreaming%26player_id%3D$PLAYER_ID&photolist_2=%2Fapi%2Fphoto%2Flist%3Fsize%3D10%26include_actions_p%3D1%26source%3Dembed%26live_id%3D$LIVE_ID%26tvm_location%3D$CHANNEL%26player_id%3D$PLAYER_ID";

HLS_URL=$(cat $TMPDIR/stream.json | grep -m 1 "hls_url" | sed 's/.*hls_url": "\([^",]*\).*/\1/');
rm -rf $TMPDIR;
echo $HLS_URL;
exit 0;
