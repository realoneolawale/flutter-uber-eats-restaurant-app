import 'dart:convert';

class AddressModel {
  String? name;
  String? secondaryName;
  String? description;
  String? placeId;
  String? latitude;
  String? longitude;

  AddressModel(
      {this.name,
      this.secondaryName,
      this.description,
      this.placeId,
      this.latitude,
      this.longitude});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'secondaryName': secondaryName,
      'description': description,
      'placeId': placeId,
      'latitude': latitude,
      'longitude': longitude
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map['name'] != null ? map['name'] as String : null,
      secondaryName:
          map['secondaryName'] != null ? map['secondaryName'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      placeId: map['placeId'] != null ? map['placeId'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
