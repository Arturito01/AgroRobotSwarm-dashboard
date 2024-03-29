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


		  <Placemark id="${robots[1].name}">
      <name>${robots[1].name}</name>

		${LookAtEntity.lookAtLinear(markers[1].latitude, markers[1].longitude, cameraPosition.zoom.zoomLG, cameraPosition.tilt, cameraPosition.bearing)}
      <styleUrl>#downArrowIcon</styleUrl>
     		<Point>
		   <altitudeMode>relativeToGround</altitudeMode>
       <coordinates>${markerCoords(1)}</coordinates>
		</Point>
    </Placemark>

    

		  <Placemark id="${robots[2].name}">
      <name>${robots[2].name}</name>
${LookAtEntity.lookAtLinear(markers[2].latitude, markers[2].longitude, cameraPosition.zoom.zoomLG, cameraPosition.tilt, cameraPosition.bearing)}
      <styleUrl>#downArrowIcon</styleUrl>
     		<Point>
		   <altitudeMode>relativeToGround</altitudeMode>
       <coordinates>${markerCoords(2)}</coordinates>
		</Point>
    </Placemark>

		  <Placemark id="${robots[3].name}">
      <name>${robots[3].name}</name>
		${LookAtEntity.lookAtLinear(markers[3].latitude, markers[3].longitude, cameraPosition.zoom.zoomLG, cameraPosition.tilt, cameraPosition.bearing)}
      <styleUrl>#downArrowIcon</styleUrl>
     		<Point>
		   <altitudeMode>relativeToGround</altitudeMode>
       <coordinates>${markerCoords(3)}</coordinates>
		</Point>
    </Placemark>

		  <Placemark id="${robots[4].name}">
      <name>${robots[4].name}</name>
		${LookAtEntity.lookAtLinear(markers[4].latitude, markers[4].longitude, cameraPosition.zoom.zoomLG, cameraPosition.tilt, cameraPosition.bearing)}
      <styleUrl>#downArrowIcon</styleUrl>
     		<Point>
		   <altitudeMode>relativeToGround</altitudeMode>
       <coordinates>${markerCoords(4)}</coordinates>
		</Point>
    </Placemark>
            <gx:Tour>
      <name>RobotPath</name>
      <gx:Playlist>
              ${animate(robots[0].name, robots[1].name, robots[2].name, robots[3].name, robots[4].name)}


      </gx:Playlist>
    </gx:Tour>

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

  animate(String? placemarkId0, String? placemarkId1, String? placemarkId2,
      String? placemarkId3, String? placemarkId4) {
    int index0 = randomIndex[0];
    int index1 = randomIndex[1];
    int index2 = randomIndex[2];
    int index3 = randomIndex[3];
    int index4 = randomIndex[4];
    String animate = "";
    for (int x = 0; x < 100; x++) {
      animate += '''
                     <gx:FlyTo>
          <gx:duration>1.5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          		${this.lookAt}

        </gx:FlyTo>
          <gx:AnimatedUpdate>
          <gx:duration>10.0</gx:duration>
          <Update>
            <targetHref/>
            <Change>
              <Placemark targetId="$placemarkId0">
                <Point>
                  <coordinates>
                  ${path[index0].longitude},${path[index0].latitude},0
                  </coordinates>
                </Point>
              </Placemark>
            </Change>
          </Update>
        </gx:AnimatedUpdate>
        
        <gx:FlyTo>
          <gx:duration>1.5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          		${this.lookAt}

        </gx:FlyTo>
          <gx:AnimatedUpdate>
          <gx:duration>10.0</gx:duration>
          <Update>
            <targetHref/>
            <Change>
              <Placemark targetId="$placemarkId1">
                <Point>
                  <coordinates>
                  ${path[index1].longitude},${path[index1].latitude},0
                  </coordinates>
                </Point>
              </Placemark>
            </Change>
          </Update>
        </gx:AnimatedUpdate>
        
        <gx:FlyTo>
          <gx:duration>1.5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          		${this.lookAt}

        </gx:FlyTo>
          <gx:AnimatedUpdate>
          <gx:duration>10.0</gx:duration>
          <Update>
            <targetHref/>
            <Change>
              <Placemark targetId="$placemarkId2">
                <Point>
                  <coordinates>
                  ${path[index2].longitude},${path[index2].latitude},0
                  </coordinates>
                </Point>
              </Placemark>
            </Change>
          </Update>
        </gx:AnimatedUpdate>
        
        <gx:FlyTo>
          <gx:duration>1.5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          		${this.lookAt}

        </gx:FlyTo>
          <gx:AnimatedUpdate>
          <gx:duration>10.0</gx:duration>
          <Update>
            <targetHref/>
            <Change>
              <Placemark targetId="$placemarkId3">
                <Point>
                  <coordinates>
                  ${path[index3].longitude},${path[index3].latitude},0
                  </coordinates>
                </Point>
              </Placemark>
            </Change>
          </Update>
        </gx:AnimatedUpdate>
        
        <gx:FlyTo>
          <gx:duration>1.5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          		${this.lookAt}

        </gx:FlyTo>
          <gx:AnimatedUpdate>
          <gx:duration>10.0</gx:duration>
          <Update>
            <targetHref/>
            <Change>
              <Placemark targetId="$placemarkId4">
                <Point>
                  <coordinates>
                  ${path[index4].longitude},${path[index4].latitude},0
                  </coordinates>
                </Point>
              </Placemark>
            </Change>
          </Update>
        </gx:AnimatedUpdate>
        
 
      ''';
      index0 ++;
      index1 ++;
      index2 ++;
      index3 ++;
      index4 ++;
      if(index0 == path.length - 2){
        index0 = 0;
      }      if(index1 == path.length - 2){
        index1 = 0;
      }      if(index2 == path.length - 2){
        index2 = 0;
      }      if(index3 == path.length - 2){
        index3 = 0;
      }      if(index4 == path.length - 2){
        index4 = 0;
      }
    }

    return animate;
  }

  text(String? placemarkId, int id, int x) {
    String animate = "";
    animate += '''
                     <gx:FlyTo>
          <gx:duration>9.5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          		${this.lookAt}

        </gx:FlyTo>
          <gx:AnimatedUpdate>
          <gx:duration>10.0</gx:duration>
          <Update>
            <targetHref/>
            <Change>
              <Placemark targetId="$placemarkId">
                <Point>
                  <coordinates>
                  ${path[(randomIndex[id] + x) % path.length].longitude},${path[(randomIndex[id] + x) % path.length].latitude},0
                  </coordinates>
                </Point>
              </Placemark>
            </Change>
          </Update>
        </gx:AnimatedUpdate>
        
 
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
