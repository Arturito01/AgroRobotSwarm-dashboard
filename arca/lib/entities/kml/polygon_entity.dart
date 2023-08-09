import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonEntity {
  String name;
  List<LatLng> coord;

  static dynamic style = {
    "lineStyle": {"color": "ff7fffff"},
    "polyStyle": {
      "color": "b37fffff",
    }
  };

  PolygonEntity(this.name, this.coord);

  String get body {
    return '''
  <?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Style id="$name">
    <LineStyle>
      <color>${style['lineStyle']['color']}</color>
      <width>10</width>
    </LineStyle>
    <PolyStyle>
      <color>${style['polyStyle']['color']}</color>
    </PolyStyle>
  </Style>
  <Placemark>
    <name>The Pentagon</name>
    <Polygon>
      <extrude>1</extrude>
      <altitudeMode>relativeToGround</altitudeMode>
      <outerBoundaryIs>
        <LinearRing>
          <coordinates>
            ${this.coordsToString()}
          </coordinates>
        </LinearRing>
      </outerBoundaryIs>
      <innerBoundaryIs>
        <LinearRing>
          <coordinates>
            ${this.coordsToString()}
          </coordinates>
        </LinearRing>
      </innerBoundaryIs>
    </Polygon>
  </Placemark>
</kml>
''';
  }

  toMap() {
    List<dynamic> coordsMapList = [];
    coord.forEach((element) {
      dynamic obj = {
        "lat": element.latitude,
        "long": element.longitude,
      };
      coordsMapList.add(obj);
    });

    return {
      "name": name,
      "coord": coordsMapList,
    };
  }

  coordsToString() {
    String stringPoints = '';
    this.coord.forEach((element) {
      stringPoints += element.latitude.toString() +
          ',' +
          element.longitude.toString() +
          ',0' +
          '\n';
    });

    stringPoints += this.coord[0].latitude.toString() +
        ',' +
        this.coord[0].longitude.toString() +
        ',0' +
        '\n';

    return stringPoints;
  }
}
