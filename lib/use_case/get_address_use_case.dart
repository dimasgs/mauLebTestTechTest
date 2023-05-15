import 'package:mau_lab_tech_test/data/repositories/candidate_repository.dart';
import 'package:mau_lab_tech_test/domain/address_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_use_case.dart';

class GetAddressUseCase
    extends BaseUseCase<List<Address>, Map<String, dynamic>> {
  late final CandidateRepository _repository;
  GetAddressUseCase(this._repository);
  @override
  Future<List<Address>> getData(Map<String, dynamic> request) {
    return _repository.getAddress(request);
  }
}
