import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mau_lab_tech_test/domain/blog_domain.dart';
import 'package:mau_lab_tech_test/domain/candidate_domain.dart';
import 'package:mau_lab_tech_test/domain/candidate_with_blog_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_controller.dart';
import 'package:mau_lab_tech_test/presentation/misc/date_utils.dart';
import 'package:mau_lab_tech_test/presentation/pages/blog/args.dart';
import 'package:mau_lab_tech_test/presentation/pages/blog/blog_page.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/args.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/candidate_page.dart';
import 'package:mau_lab_tech_test/presentation/pages/home/home_presenter.dart';

class HomeController extends BaseController {
  final HomePresenter _presenter;
  HomeController(
    this._presenter,
  );

  final List<Candidate> _candidateList = [];
  List<Candidate> get candidateList => _candidateList;

  final List<Blog> _blogList = [];
  List<Blog> get blogList => _blogList;

  final List<CandidateWithBlog> _duplicateItems = [];
  List<CandidateWithBlog> get duplicateItems => _duplicateItems;

  List<CandidateWithBlog> _candidateWithBlog = [];
  List<CandidateWithBlog> get candidateWithBlog => _candidateWithBlog;

  final TextEditingController _searchTextController = TextEditingController();
  TextEditingController get searchTextController => _searchTextController;

  String _error = "";
  String get error => _error;

  @override
  void initListeners() {
    super.initListeners();
    _initObserver();
    _getCandidateList();
  }

  void _initObserver() {
    _presenter.onSuccess = (data) {
      _candidateList.clear();
      _candidateList.addAll(data);
      // show only expired candidate
      _candidateList.removeWhere(
          (element) => element.expired.compareTo(DateTime.now()) > 0);
    };
    _presenter.onComplete = () {
      _getBlogList();
    };
    _presenter.onError = (e) {
      e = e as DioError;
      _error = e.message;
      hideLoading();
    };

    _presenter.onSuccessGetBlogList = (data) {
      _blogList.addAll(data);
      refreshUI();
    };
    _presenter.onCompleteGetBlogList = () {
      getData();
      hideLoading();
    };
    _presenter.onErrorGetBlogList = (e) {
      e = e as DioError;
      _error = e.message;
      hideLoading();
    };
  }

  void _getCandidateList() {
    showLoading();
    _presenter.onGetNewsCandidate(<String, dynamic>{});
  }

  void _getBlogList() {
    showLoading();
    _presenter.onGetBlogList(<String, dynamic>{});
  }

  String formatDate(String time) {
    return DateUtil.formattedDate(
      time,
      inputPattern: DateUtil.YYYY_MM_DD_HH_MM,
    );
  }

  List<CandidateWithBlog> getData() {
    // create new item that combine candidates and blogs
    for (var c in _candidateList) {
      _duplicateItems.add(CandidateWithBlog(
        candidateBirthDate: c.birthDay,
        candidateGender: c.gender,
        candidateId: c.id,
        image: c.photo,
        title: c.name,
      ));
    }
    for (var b in _blogList) {
      _duplicateItems.add(CandidateWithBlog(
        image: b.photo,
        title: b.title,
        blogAuthor: b.author,
        blogContent: b.content,
        blogCreatedAt: b.createdAt,
        blogId: b.id,
      ));
    }
    _candidateWithBlog = _duplicateItems;
    return _duplicateItems;
  }

  void gotoDetailCandidate(CandidateWithBlog candidate) {
    Navigator.pushNamed(context, CandidatePage.route,
        arguments: CandidateDetailArguments(candidate: candidate));
  }

  void gotoDetailBlog(CandidateWithBlog blog) {
    Navigator.pushNamed(context, BlogPage.route,
        arguments: BlogDetailArguments(blog: blog));
  }

  void filterSearchResults(String query) {
    _candidateWithBlog = _duplicateItems
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    refreshUI();
  }
}
