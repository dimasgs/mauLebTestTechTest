class Address {
  final int id, zipCode;
  final String address, city, state;

  Address({
    required this.address,
    required this.city,
    required this.id,
    required this.state,
    required this.zipCode,
  });

  static Address empty = Address(
    id: 0,
    address: '',
    city: '',
    state: '',
    zipCode: 0,
  );

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] ?? 0,
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zipCode: json['zip_code'] ?? 0,
    );
  }
}
