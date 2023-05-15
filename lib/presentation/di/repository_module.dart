import 'package:get_it/get_it.dart';
import 'package:mau_lab_tech_test/data/repositories/candidate_repository.dart';

class RepositoryModule {
  static void init() {
    var di = GetIt.I;
    di.registerFactory<CandidateRepository>(
      () => CandidateRepositoryImpl(di.get(), di.get()),
    );
  }
}
