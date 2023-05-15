import 'package:mau_lab_tech_test/presentation/base/base_controller.dart';
import 'package:mau_lab_tech_test/presentation/pages/blog/args.dart';

class BlogController extends BaseController {
  BlogController();

  late BlogDetailArguments _arguments;

  BlogDetailArguments get arguments => _arguments;

  void setArguments(BlogDetailArguments arguments) {
    _arguments = arguments;
    refreshUI();
  }
}
