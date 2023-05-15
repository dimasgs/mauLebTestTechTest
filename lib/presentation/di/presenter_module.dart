import 'package:get_it/get_it.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/candidate_presenter.dart';
import 'package:mau_lab_tech_test/presentation/pages/home/home_presenter.dart';

class PresenterModule {
  static void init() {
    var di = GetIt.I;
    di.registerFactory(() => HomePresenter(di.get(), di.get()));
    di.registerFactory(() => CandidatePresenter(di.get(), di.get(), di.get()));
  }
}
