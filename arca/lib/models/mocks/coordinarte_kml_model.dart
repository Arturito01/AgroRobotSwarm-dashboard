class CoordinateKmlModel{
  late final double latitude;
  late final double longitude;
  late final double elevation;

  CoordinateKmlModel(List<double> coordinate): assert(coordinate.length == 3) {
    latitude = coordinate[0];
    longitude = coordinate[1];
    elevation = coordinate[2];
  }
  @override
  String toString() {
    return "Coordinate: {$latitude, $longitude, $elevation}";
  }
}