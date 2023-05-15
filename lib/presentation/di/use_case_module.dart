import 'package:get_it/get_it.dart';
import 'package:mau_lab_tech_test/domain/candidate_domain.dart';
import 'package:mau_lab_tech_test/domain/experience_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_use_case.dart';
import 'package:mau_lab_tech_test/use_case/get_address_use_case.dart';
import 'package:mau_lab_tech_test/use_case/get_blogs_list_use_case.dart';
import 'package:mau_lab_tech_test/use_case/get_candidates_list_use_case.dart';
import 'package:mau_lab_tech_test/use_case/get_emails_use_case.dart';
import 'package:mau_lab_tech_test/use_case/get_experience_use_case.dart';

class UseCaseModule {
  static void init() {
    var di = GetIt.I;
    di.registerFactory<BaseUseCase<List<Candidate>, Map<String, dynamic>>>(
      () => GetCandidatesListUseCase(di.get()),
    );
    di.registerFactory<GetBlogsListUseCase>(
      () => GetBlogsListUseCase(di.get()),
    );
    di.registerFactory<BaseUseCase<List<Experience>, Map<String, dynamic>>>(
      () => GetExperienceUseCase(di.get()),
    );
    di.registerFactory<GetExperienceUseCase>(
      () => GetExperienceUseCase(di.get()),
    );
    di.registerFactory<GetEmailUseCase>(
      () => GetEmailUseCase(di.get()),
    );
    di.registerFactory<GetAddressUseCase>(
      () => GetAddressUseCase(di.get()),
    );
  }
}
