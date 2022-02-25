import 'package:equatable/equatable.dart';
import 'package:flutter_testing/core/models/models.dart';

class Address extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  const Address.empty()
      : street = '',
        suite = '',
        city = '',
        zipcode = '',
        geo = const Geo.empty();

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: Geo.fromJson(json['geo']),
      );

  Map<String, dynamic> toJson() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo.toJson()
      };

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) =>
      Address(
        street: street ?? this.street,
        suite: suite ?? this.suite,
        city: city ?? this.city,
        zipcode: zipcode ?? this.zipcode,
        geo: geo ?? this.geo,
      );

  String get fullAddress => '$street $suite $city $zipcode';

  @override
  List<Object> get props => [street, suite, city, zipcode, geo];
}
