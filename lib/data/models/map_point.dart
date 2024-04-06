import 'package:equatable/equatable.dart';

class MapPoint extends Equatable{
  const MapPoint({
    required this.name,
    required this.lat,
    required this.long,
  });

  final String name;
  final double lat;
  final double long;

  @override
  List<Object?> get props => [name, lat, long];
}