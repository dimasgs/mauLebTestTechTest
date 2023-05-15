import 'package:mau_lab_tech_test/data/repositories/candidate_repository.dart';
import 'package:mau_lab_tech_test/domain/email_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_use_case.dart';

class GetEmailUseCase extends BaseUseCase<List<Email>, Map<String, dynamic>> {
  late final CandidateRepository _repository;
  GetEmailUseCase(this._repository);
  @override
  Future<List<Email>> getData(Map<String, dynamic> request) {
    return _repository.getEmails(request);
  }
}
