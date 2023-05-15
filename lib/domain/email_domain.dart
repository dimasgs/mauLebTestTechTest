class Email {
  final int id;
  final String email, phone;

  Email({
    required this.email,
    required this.id,
    required this.phone,
  });
  static Email empty = Email(
    id: 0,
    email: '',
    phone: '',
  );

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
