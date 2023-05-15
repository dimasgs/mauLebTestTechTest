import 'package:mau_lab_tech_test/data/service/api_service.dart';
import 'package:mau_lab_tech_test/domain/address_domain.dart';
import 'package:mau_lab_tech_test/domain/blog_domain.dart';
import 'package:mau_lab_tech_test/domain/candidate_domain.dart';
import 'package:mau_lab_tech_test/domain/email_domain.dart';
import 'package:mau_lab_tech_test/domain/experience_domain.dart';
import 'package:mau_lab_tech_test/presentation/misc/endpoints.dart';

abstract class CandidateRepository {
  Future<List<Candidate>> getCandidates(Map<String, dynamic> request);
  Future<List<Blog>> getBlogs(Map<String, dynamic> request);
  Future<List<Address>> getAddress(Map<String, dynamic> request);
  Future<List<Email>> getEmails(Map<String, dynamic> request);
  Future<List<Experience>> getExperiences(Map<String, dynamic> request);
}

class CandidateRepositoryImpl implements CandidateRepository {
  late final ApiService _service;
  late final Endpoints _endpoints;

  CandidateRepositoryImpl(this._service, this._endpoints);
  @override
  Future<List<Candidate>> getCandidates(Map<String, dynamic> request) async {
    var response = await _service.invokeHttp(
      _endpoints.getCandidatesList,
      RequestType.get,
    );
    var data = (response['results'] ?? []) as List<dynamic>;
    return data.map((json) => Candidate.fromJson(json)).toList();
  }

  @override
  Future<List<Blog>> getBlogs(Map<String, dynamic> request) async {
    var response = await _service.invokeHttp(
      _endpoints.getBlogsList,
      RequestType.get,
    );
    var data = (response['results'] ?? []) as List<dynamic>;
    return data.map((json) => Blog.fromJson(json)).toList();
  }

  @override
  Future<List<Address>> getAddress(Map<String, dynamic> request) async {
    var response = await _service.invokeHttp(
      _endpoints.getAddress,
      RequestType.get,
    );
    var data = (response['results'] ?? []) as List<dynamic>;
    return data.map((json) => Address.fromJson(json)).toList();
  }

  @override
  Future<List<Email>> getEmails(Map<String, dynamic> request) async {
    var response = await _service.invokeHttp(
      _endpoints.getEmails,
      RequestType.get,
    );
    var data = (response['results'] ?? []) as List<dynamic>;
    return data.map((json) => Email.fromJson(json)).toList();
  }

  @override
  Future<List<Experience>> getExperiences(Map<String, dynamic> request) async {
    var response = await _service.invokeHttp(
      _endpoints.getExperiences,
      RequestType.get,
    );
    var data = (response['results'] ?? []) as List<dynamic>;
    return data.map((json) => Experience.fromJson(json)).toList();
  }
}
