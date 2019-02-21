if [ -z "$1" ]
then
      echo "Usage: sh heatmap.sh <strava_export>.zip"
      exit 1
fi

unzip $1 -d strava
cd strava

cd activities

# Unzip .fit.gz
gunzip *.gz


for f in *.fit
do
  echo "Converting fit file - $f"
  gpsbabel -i garmin_fit -f $f -o gpx -F "$f".gpx
done

echo "Converting and joining gpx"

for f in *.gpx
do
  file_list=" -f $f"$file_list
done

gpsbabel -i gpx $file_list -o kml,points=0 -F ../../heatmap.kml
#gpsbabel -i gpx -f 991171691.gpx -f 976097134.gpx -f 974296119.gpx -f 972509242.gpx -f 971215535.gpx -f 971215490.gpx -f 877095888.gpx -o kml,points=0 -F ../../heatmap.kml
cd ../../

rm -rf strava
