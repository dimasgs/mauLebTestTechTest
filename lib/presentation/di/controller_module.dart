import 'package:mau_lab_tech_test/presentation/pages/blog/blog_controller.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/candidate_controller.dart';
import 'package:mau_lab_tech_test/presentation/pages/home/home_controller.dart';
import 'package:get_it/get_it.dart';

class ControllerModule {
  static void init() {
    var di = GetIt.I;
    di.registerFactory<HomeController>(() {
      return HomeController(di.get());
    });
    di.registerFactory<CandidateController>(() {
      return CandidateController(di.get());
    });
    di.registerFactory<BlogController>(() {
      return BlogController();
    });
  }
}
