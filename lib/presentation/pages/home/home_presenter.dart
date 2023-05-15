import 'package:mau_lab_tech_test/domain/blog_domain.dart';
import 'package:mau_lab_tech_test/domain/candidate_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_presenter.dart';
import 'package:mau_lab_tech_test/use_case/get_blogs_list_use_case.dart';

class HomePresenter
    extends BasePresenter<List<Candidate>, Map<String, dynamic>> {
  final GetBlogsListUseCase _getBlogsListUseCase;

  HomePresenter(
    super.useCase,
    this._getBlogsListUseCase,
  );

  late Function(List<Blog>) onSuccessGetBlogList;
  late Function(dynamic) onErrorGetBlogList;
  late Function() onCompleteGetBlogList;

  void onGetNewsCandidate(Map<String, dynamic> request) {
    execute(request: request);
  }

  void onGetBlogList(Map<String, dynamic> request) async {
    try {
      var data = await _getBlogsListUseCase.execute(request: request);
      onSuccessGetBlogList(data);
    } catch (e) {
      onErrorGetBlogList(e);
    } finally {
      onCompleteGetBlogList();
    }
  }
}
