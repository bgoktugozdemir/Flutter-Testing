import 'package:equatable/equatable.dart';

class Geo extends Equatable {
  final String lat;
  final String lng;

  const Geo({
    required this.lat,
    required this.lng,
  });

  const Geo.empty()
      : lat = '',
        lng = '';

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json['lat'],
        lng: json['lng'],
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };

  Geo copyWith({
    String? lat,
    String? lng,
  }) =>
      Geo(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  @override
  List<Object> get props => [lat, lng];
}
