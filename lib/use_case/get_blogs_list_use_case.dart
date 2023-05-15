import 'package:mau_lab_tech_test/data/repositories/candidate_repository.dart';
import 'package:mau_lab_tech_test/domain/blog_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_use_case.dart';

class GetBlogsListUseCase
    extends BaseUseCase<List<Blog>, Map<String, dynamic>> {
  late final CandidateRepository _repository;
  GetBlogsListUseCase(this._repository);
  @override
  Future<List<Blog>> getData(Map<String, dynamic> request) {
    return _repository.getBlogs(request);
  }
}
