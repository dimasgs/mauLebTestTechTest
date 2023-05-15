import 'package:mau_lab_tech_test/presentation/misc/date_utils.dart';

class Candidate {
  final String name, gender, photo;
  final int id;
  final DateTime birthDay, expired;
  String? address, email, status;

  Candidate({
    required this.id,
    required this.name,
    required this.gender,
    required this.photo,
    required this.birthDay,
    required this.expired,
    this.address,
    this.email,
    this.status,
  });

  static Candidate empty = Candidate(
    id: 0,
    name: '',
    gender: '',
    photo: '',
    birthDay: DateTime.now(),
    expired: DateTime.now(),
    address: '',
    email: '',
    status: '',
  );

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      photo: json['photo'] ?? '',
      birthDay: DateUtil().fromSeconds(json['birthday'] ?? 0),
      expired: DateUtil().fromSeconds(json['expired'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    var data = {};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['photo'] = photo;
    data['address'] = address;
    data['email'] = email;
    data['status'] = status;
    return {"data": data};
  }
}
