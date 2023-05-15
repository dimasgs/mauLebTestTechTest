import 'package:dio/dio.dart';

abstract class JsonRequest {
  Map<String, dynamic> toJson();
}

abstract class FormDataRequest {
  FormData toFormData();
}
