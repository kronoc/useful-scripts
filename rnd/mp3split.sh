source="$1"
artist="$2"
album="$3"
declare -a breaks=($4 "99:99:99")
titles=$5
#titles need some work

i=0
for title in $titles
do
echo ${breaks[$i]}

echo "ffmpeg -i $source -vn -acodec copy -ss ${breaks[$i]} -to ${breaks[$i+1]} $artist-$title.mp3"
#id3tag $artist-$title.mp3
((++i))
done
