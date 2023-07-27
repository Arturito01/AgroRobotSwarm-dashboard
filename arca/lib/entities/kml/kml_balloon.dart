import '../../models/land.dart';
import '../../models/robot.dart';

class KMLBalloonEntity {
  String name;
  Robot? robot;
  Land? land;
  String screenOverlay;

  KMLBalloonEntity({
    required this.name,
    required this.robot,
    required this.land,
    this.screenOverlay = '',
  });

  String get body => '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Document>
	<name>$name.kml</name>
	<Style id="purple_paddle">
		<IconStyle>
			<Icon>
				<href>https://raw.githubusercontent.com/yashrajbharti/kml-images/main/molten.png</href>
			</Icon>
		</IconStyle>
		<BalloonStyle>
			<text>\$[description]</text>
      <bgColor>ff1e1e1e</bgColor>
		</BalloonStyle>
	</Style>
	<Placemark id="0A7ACC68BF23CB81B354">
		<name>"HIII"</name>
		<Snippet maxLines="0"></Snippet>
		<description><![CDATA[<!-- BalloonStyle background color:
ffffffff
 -->
<!-- Icon URL:
http://maps.google.com/mapfiles/kml/paddle/purple-blank.png
 -->
<table width="400" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td colspan="2" align="center">
      <img src="https://i.imgur.com/GJWlzhh.png" alt="picture" width="150" height="150" />
    </td>
  </tr>
  <catalog>
    <cd>
      <name><h1><font color='#00CC99'>${robot?.name}</font></h1></name>
    </cd>
  </catalog>
    <tr>
    <td colspan="2" align="center">
      <div style = "display:flex;">
        <h1><font color='#00CC99'>Robot Name</font></h1>
        <h1><font color='#00CC99'>${robot?.name}</font></h1>
      </div>
      <h1><font color='#00CC99'>${robot?.battery}</font></h1>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <h1><font color='#00CC99'>${robot?.actualKg}</font></h1>
      <h1><font color='#00CC99'>${robot?.actualDistance}</font></h1>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <h1><font color='#00CC99'>${robot?.totalKg}</font></h1>
      <h1><font color='#00CC99'>${robot?.totalDistance}</font></h1>
    </td>
  </tr>
</table>]]></description>
		<LookAt>
			<longitude>${land?.long}</longitude>
			<latitude>${land?.lat}</latitude>
			<altitude>0</altitude>
			<heading>0</heading>
			<tilt>0</tilt>
			<range>24000</range>
		</LookAt>
		<styleUrl>#purple_paddle</styleUrl>
		<gx:balloonVisibility>1</gx:balloonVisibility>
		<Point>
			<coordinates>${land?.long}, ${land?.lat},0</coordinates>
		</Point>
	</Placemark>
</Document>
</kml>
  ''';
}
