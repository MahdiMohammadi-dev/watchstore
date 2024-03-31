class AddressModel {
  String address;
  double lat;
  double lng;
  String postalCode;

  AddressModel({
    required this.address,
    required this.lat,
    required this.lng,
    required this.postalCode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json['address'],
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
      postalCode: json['postal_code'],
    );
  }
}
