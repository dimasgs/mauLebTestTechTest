class Endpoints {
  String baseUrl;
  Endpoints(this.baseUrl);
  String get getCandidatesList => 'candidates';
  String get getBlogsList => 'blogs';
  String get getAddress => 'address';
  String get getEmails => 'emails';
  String get getExperiences => 'experiences';
}
