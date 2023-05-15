class Experience {
  final int id;
  final String status, jobTitle, companyName, industry;

  Experience({
    required this.companyName,
    required this.id,
    required this.industry,
    required this.jobTitle,
    required this.status,
  });

  static Experience empty = Experience(
    id: 0,
    companyName: '',
    industry: '',
    jobTitle: '',
    status: '',
  );

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'] ?? 0,
      companyName: json['company_name'] ?? '',
      industry: json['industry'] ?? '',
      jobTitle: json['job_title'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
