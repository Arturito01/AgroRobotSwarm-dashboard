import '../../models/land.dart';

class KMLImageEntity {
  String name;
  String image;
  Land? land;

  KMLImageEntity({
    required this.name,
    required this.image,
    required this.land,
  });

  String get body => '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Document>
	<name>$name.kml</name>
	<Style id="purple_paddle">
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
      <img src="https://raw.githubusercontent.com/Arturito01/AgroRobotSwarm-dashboard/main/arca/$image" alt="picture" width="620" height="410" />
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
