class CandidateWithBlog {
  final String title, image;
  final String? candidateGender, blogContent, blogAuthor;
  final int? candidateId, blogId;
  final DateTime? blogCreatedAt, candidateBirthDate;

  CandidateWithBlog({
    this.blogAuthor,
    this.blogContent,
    this.blogCreatedAt,
    this.blogId,
    this.candidateBirthDate,
    this.candidateGender,
    this.candidateId,
    required this.image,
    required this.title,
  });
}
