import 'package:mau_lab_tech_test/presentation/misc/date_utils.dart';

class Blog {
  final String title, subTitle, photo, content, author, tag;
  final int id;
  final DateTime createdAt;

  Blog({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.photo,
    required this.author,
    required this.content,
    required this.createdAt,
    required this.tag,
  });

  static Blog empty = Blog(
    id: 0,
    title: '',
    subTitle: '',
    photo: '',
    author: '',
    content: '',
    createdAt: DateTime.now(),
    tag: '',
  );

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      subTitle: json['subTitle'] ?? '',
      photo: json['photo'] ?? '',
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      createdAt: DateUtil().fromSeconds(json['create_at'] ?? 0),
      tag: json['tag'] ?? '',
    );
  }
}
