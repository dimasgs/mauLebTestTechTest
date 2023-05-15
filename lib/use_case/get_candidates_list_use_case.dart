import 'package:mau_lab_tech_test/data/repositories/candidate_repository.dart';
import 'package:mau_lab_tech_test/domain/candidate_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_use_case.dart';

class GetCandidatesListUseCase
    extends BaseUseCase<List<Candidate>, Map<String, dynamic>> {
  late final CandidateRepository _repository;
  GetCandidatesListUseCase(this._repository);
   
  @override
  Future<List<Candidate>> getData(Map<String, dynamic> request) {
    return _repository.getCandidates(request);
  }
}
