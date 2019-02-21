brew install gpsbabel
`gpsbabel -i gpx -f Morning_Activity.gpx -o kml,points=0 -F a.kml` # Remove all waypoints
gpsbabel -i gpx -f Morning_Activity (1).gpx -f Morning_Activity.gpx -o kml,points=0 -F b.kml # Multi file
