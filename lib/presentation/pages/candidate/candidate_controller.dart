import 'package:dio/dio.dart';
import 'package:mau_lab_tech_test/domain/address_domain.dart';
import 'package:mau_lab_tech_test/domain/candidate_domain.dart';
import 'package:mau_lab_tech_test/domain/email_domain.dart';
import 'package:mau_lab_tech_test/domain/experience_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_controller.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/args.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/candidate_presenter.dart';

class CandidateController extends BaseController {
  final CandidatePresenter _presenter;
  CandidateController(this._presenter);

  final List<Experience> _experienceList = [];
  List<Experience> get experienceList => _experienceList;

  final List<Address> _addressList = [];
  List<Address> get addressList => _addressList;

  final List<Email> _emailList = [];
  List<Email> get emailList => _emailList;

  late CandidateDetailArguments _arguments;
  CandidateDetailArguments get arguments => _arguments;

  String _error = "";
  String get error => _error;

  void setArguments(CandidateDetailArguments arguments) {
    _arguments = arguments;
    refreshUI();
  }

  @override
  void initListeners() {
    super.initListeners();
    _initObserver();
    _getExperienceList();
  }

  void _getExperienceList() {
    showLoading();
    _presenter.onGetAddressList(<String, dynamic>{});
    _presenter.onGetExperience(<String, dynamic>{});
    _presenter.onGetEmailList(<String, dynamic>{});
  }

  void _initObserver() {
    _presenter.onSuccess = (data) {
      _experienceList.clear();
      _experienceList.addAll(data);
    };
    _presenter.onComplete = hideLoading;
    _presenter.onError = (e) {
      e = e as DioError;
      _error = e.message;
      hideLoading();
    };

    _presenter.onSuccessGetAddressList = (data) {
      _addressList.clear();
      _addressList.addAll(data);
    };
    _presenter.onCompleteGetAddressList = hideLoading;
    _presenter.onErrorGetAddressList = (e) {
      e = e as DioError;
      _error = e.message;
      hideLoading();
    };

    _presenter.onSuccessGetEmailList = (data) {
      _emailList.clear();
      _emailList.addAll(data);
    };
    _presenter.onCompleteGetEmailList = () {
      hideLoading();
      getCandidateDetail();
    };
    _presenter.onErrorGetEmailList = (e) {
      e = e as DioError;
      _error = e.message;
      hideLoading();
    };
  }

  Candidate getCandidateDetail() {
    Candidate candidateDetail = Candidate.empty;
    for (var element in _addressList) {
      if (element.id == arguments.candidate.candidateId) {
        candidateDetail.address = element.address;
      }
    }
    for (var element in _emailList) {
      if (element.id == arguments.candidate.candidateId) {
        candidateDetail.email = element.email;
      }
    }

    for (var element in _experienceList) {
      if (element.id == arguments.candidate.candidateId) {
        candidateDetail.status = element.status;
      }
    }
    print("candidateDetail: ${candidateDetail.toJson()}");
    return candidateDetail;
  }
}
