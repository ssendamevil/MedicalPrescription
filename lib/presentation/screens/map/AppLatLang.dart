class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class AstanaLocation extends AppLatLong {
  const AstanaLocation({
    super.lat = 51.169392,
    super.long = 71.449074,
  });
}