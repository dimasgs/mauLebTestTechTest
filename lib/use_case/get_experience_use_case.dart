import 'package:mau_lab_tech_test/data/repositories/candidate_repository.dart';
import 'package:mau_lab_tech_test/domain/experience_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_use_case.dart';

class GetExperienceUseCase
    extends BaseUseCase<List<Experience>, Map<String, dynamic>> {
  late final CandidateRepository _repository;
  GetExperienceUseCase(this._repository);
  @override
  Future<List<Experience>> getData(Map<String, dynamic> request) {
    return _repository.getExperiences(request);
  }
}
