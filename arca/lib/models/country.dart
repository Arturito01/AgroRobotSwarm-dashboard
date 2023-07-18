class Country {
  final int id;
  final String country;
  final double long;
  final double lat;

  Country({required this.id, required this.country,  required this.long, required this.lat});

  @override
  String toString() {
    return "country: {id = $id, country = $country}\n";

  }
}