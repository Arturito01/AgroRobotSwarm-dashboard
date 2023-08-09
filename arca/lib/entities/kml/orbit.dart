import 'package:arca/entities/kml/look_at_entity.dart';

class OrbitEntity {
  static tag(LookAtEntity marker) {
    double heading = double.parse(marker.heading);
    int orbit = 0;
    String content = '';
    String range = '100';
    double altitude = marker.altitude + 100;

    while (orbit <= 36) {
      if (heading >= 360) heading -= 360;
      content += '''
            <gx:FlyTo>
              <gx:duration>1.2</gx:duration>
              <gx:flyToMode>smooth</gx:flyToMode>
              <LookAt>
                  <longitude>${marker.lng}</longitude>
                  <latitude>${marker.lat}</latitude>
                  <heading>$heading</heading>
                  <tilt>0</tilt>
                  <range>${range}</range>
                  <gx:fovy>60</gx:fovy> 
                  <altitude>${altitude}</altitude> 
                  <gx:altitudeMode>${marker.altitudeMode}</gx:altitudeMode>
              </LookAt>
            </gx:FlyTo>
          ''';
      heading += 10;
      orbit += 1;
    }
    return content;
  }

  static buildOrbit(String content) {
    String kmlOrbit = '''
<?xml version="1.0" encoding="UTF-8"?>
      <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
        <gx:Tour>
          <name>Orbit</name>
          <gx:Playlist> 
            $content
          </gx:Playlist>
        </gx:Tour>
      </kml>
    ''';
    return kmlOrbit;
  }
}
