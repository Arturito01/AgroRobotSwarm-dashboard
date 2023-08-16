import 'package:arca/entities/kml/look_at_entity.dart';
import 'package:arca/utils/extensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/robot.dart';

class PolygonEntity {
  String name;
  List<LatLng> coord;
  String lookAt;
  List<LatLng> markers;
  CameraPosition cameraPosition;
  List<Robot> robots;
  List<LatLng> path;
  List<int> randomIndex;

  PolygonEntity(this.name, this.coord, this.lookAt, this.markers,
      this.cameraPosition, this.robots, this.path, this.randomIndex);

  String get body {
    return '''   
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Document>
<gx:CascadingStyle kml:id="__managed_style_0E29F89C5B2B149F522C">
		<Style>
			<IconStyle>
				<scale>1.2</scale>
				<Icon>
					<href>https://earth.google.com/earth/rpc/cc/icon?color=1976d2&amp;id=2000&amp;scale=4</href>
				</Icon>
				<hotSpot x="64" y="128" xunits="pixels" yunits="insetPixels"/>
			</IconStyle>
			<LabelStyle>
			</LabelStyle>
			<LineStyle>
				<color>ffd27619</color>
				<width>14.4</width>
			</LineStyle>
			<PolyStyle>
				<color>40f5a542</color>
			</PolyStyle>
			<BalloonStyle>
				<displayMode>hide</displayMode>
			</BalloonStyle>
		</Style>
	</gx:CascadingStyle>
	<gx:CascadingStyle kml:id="__managed_style_15B8B12B4E2B149F522B">
		<Style>
			<IconStyle>
				<Icon>
					<href>https://earth.google.com/earth/rpc/cc/icon?color=1976d2&amp;id=2000&amp;scale=4</href>
				</Icon>
				<hotSpot x="64" y="128" xunits="pixels" yunits="insetPixels"/>
			</IconStyle>
			<LabelStyle>
			</LabelStyle>
			<LineStyle>
				<color>ffd27619</color>
				<width>9.6</width>
			</LineStyle>
			<PolyStyle>
				<color>40f5a542</color>
			</PolyStyle>
			<BalloonStyle>
				<displayMode>hide</displayMode>
			</BalloonStyle>
		</Style>
	</gx:CascadingStyle>
	<Style id="transPurpleLineGreenPoly">
      <LineStyle>
        <color>ffff0000</color>
        <width>8</width>
      </LineStyle>
      <PolyStyle>
        <color>ffff0000</color>
      </PolyStyle>
    </Style>
      <Style id="downArrowIcon">
      <IconStyle>
        <Icon>
<href>http://maps.google.com/mapfiles/kml/pal4/icon28.png</href>        </Icon>
      </IconStyle>
    </Style>
    
    <Style id="line-HCWT-8742-0349-4672-9376">
      <LineStyle>
        <color>ff4444ff</color>
        <colorMode>normal</colorMode>
        <width>5.0</width>
        <gx:outerColor>ff4444ff</gx:outerColor>
        <gx:outerWidth>0.0</gx:outerWidth>
        <gx:physicalWidth>0.0</gx:physicalWidth>
        <gx:labelVisibility>0</gx:labelVisibility>
      </LineStyle>
      <PolyStyle>
        <color>00000000</color>
      </PolyStyle>
    </Style>
    
	<Placemark id="0089C98B3F2B1490132C">
		<name>Polygon</name>
		${this.lookAt}
		<styleUrl>#transPurpleLineGreenPoly</styleUrl>
		<Polygon>
			<outerBoundaryIs>
				<LinearRing>
					<coordinates>
					${this.coordsToString()}
					</coordinates>
				</LinearRing>
			</outerBoundaryIs>
		</Polygon>
	</Placemark>
	    ${returnPath()}

		  <Placemark id="${robots[0].name}">
      <name>${robots[0].name}</name>
 
		${LookAtEntity.lookAtLinear(markers[0].latitude, markers[0].longitude, cameraPosition.zoom.zoomLG, cameraPosition.tilt, cameraPosition.bearing)}
      <styleUrl>#downArrowIcon</styleUrl>
     		<Point>
		   <altitudeMode>relativeToGround</altitudeMode>
       <coordinates>${markerCoords(0)}</coordinates>
		</Point>
    </Placemark>
    
        ${animate(robots[0].name, 0)}

		  <Placemark id="${robots[1].name}">
      <name>${robots[1].name}</name>
      <description><![CDATA[
          <p><b>Scientific Name:</b> "NAME"</p>
          <p><b>Density:</b> "Density"</p>
          <p><b>CO2 Capture:</b> "CO2" kg/year</p>
          ]]></description>
		${LookAtEntity.lookAtLinear(markers[1].latitude, markers[1].longitude, cameraPosition.zoom.zoomLG, cameraPosition.tilt, cameraPosition.bearing)}
      <styleUrl>#downArrowIcon</styleUrl>
     		<Point>
		   <altitudeMode>relativeToGround</altitudeMode>
       <coordinates>${markerCoords(1)}</coordinates>
		</Point>
    </Placemark>
		  <Placemark id="${robots[2].name}">
      <name>${robots[2].name}</name>
      <description><![CDATA[
          <p><b>Scientific Name:</b> "NAME"</p>
          <p><b>Density:</b> "Density"</p>
          <p><b>CO2 Capture:</b> "CO2" kg/year</p>
          ]]></description>
		${LookAtEntity.lookAtLinear(markers[2].latitude, markers[2].longitude, cameraPosition.zoom.zoomLG, cameraPosition.tilt, cameraPosition.bearing)}
      <styleUrl>#downArrowIcon</styleUrl>
     		<Point>
		   <altitudeMode>relativeToGround</altitudeMode>
       <coordinates>${markerCoords(2)}</coordinates>
		</Point>
    </Placemark>
		  <Placemark id="${robots[3].name}">
      <name>${robots[3].name}</name>
      <description><![CDATA[
          <p><b>Scientific Name:</b> "NAME"</p>
          <p><b>Density:</b> "Density"</p>
          <p><b>CO2 Capture:</b> "CO2" kg/year</p>
          ]]></description>
		${LookAtEntity.lookAtLinear(markers[3].latitude, markers[3].longitude, cameraPosition.zoom.zoomLG, cameraPosition.tilt, cameraPosition.bearing)}
      <styleUrl>#downArrowIcon</styleUrl>
     		<Point>
		   <altitudeMode>relativeToGround</altitudeMode>
       <coordinates>${markerCoords(3)}</coordinates>
		</Point>
    </Placemark>
		  <Placemark id="${robots[4].name}">
      <name>${robots[4].name}</name>
      <description><![CDATA[
          <p><b>Scientific Name:</b> "NAME"</p>
          <p><b>Density:</b> "Density"</p>
          <p><b>CO2 Capture:</b> "CO2" kg/year</p>
          ]]></description>
		${LookAtEntity.lookAtLinear(markers[4].latitude, markers[4].longitude, cameraPosition.zoom.zoomLG, cameraPosition.tilt, cameraPosition.bearing)}
      <styleUrl>#downArrowIcon</styleUrl>
     		<Point>
		   <altitudeMode>relativeToGround</altitudeMode>
       <coordinates>${markerCoords(4)}</coordinates>
		</Point>
    </Placemark>
	
</Document>
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

  markerCoords(int i) {
    String coordinates = "${markers[i].longitude},${markers[i].latitude},0";
    return coordinates;
  }

  coordsToString() {
    String stringPoints = '';
    this.coord.forEach((element) {
      stringPoints += element.longitude.toString() +
          ',' +
          element.latitude.toString() +
          ',0' +
          '\n';
    });

    stringPoints += this.coord[0].longitude.toString() +
        ',' +
        this.coord[0].latitude.toString() +
        ',0' +
        '\n';

    return stringPoints;
  }

  animate(String? placemarkId, int id) {
    String animate = '''
            <gx:Tour>
      <name>RobotPath</name>
      <gx:Playlist>
    ''';
    int x = 0;
    for (int i = randomIndex[id]; i < path.length; i++) {
      animate += '''
                     <gx:FlyTo>
          <gx:duration>0.4</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          		${this.lookAt}

        </gx:FlyTo>
          <gx:AnimatedUpdate>
          <gx:duration>2</gx:duration>
          <Update>
            <targetHref/>
            <Change>
              <Placemark targetId="$placemarkId">
                <Point>
                  <coordinates>
                  ${path[i].longitude},${path[i].latitude},0
                  </coordinates>
                </Point>
              </Placemark>
            </Change>
          </Update>
        </gx:AnimatedUpdate>
      ''';
      if (i == path.length) {
        i = 0;
      }
      x++;
      if (x == 100) {
        i = path.length + 5;
      }
    }
    animate += '''
          </gx:Playlist>
    </gx:Tour>
    ''';
    return animate;
  }

  returnPath() {
    String path = '''
        
    <Placemark>
      <name>"Path"</name>
      <styleUrl>line-HCWT-8742-0349-4672-9376</styleUrl>
            <Polygon id="Path">
        <extrude>0</extrude>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              ${pathCoords()}
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    
    </Placemark>
    
    ''';
    return path;
  }

  pathCoords() {
    String newPath = "";
    for (int i = 0; i < path.length; i++) {
      newPath += "${path[i].longitude},${path[i].latitude},0\n";
    }
    return newPath;
  }
}
