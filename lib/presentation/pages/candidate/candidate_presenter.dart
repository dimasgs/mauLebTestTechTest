import 'package:mau_lab_tech_test/domain/address_domain.dart';
import 'package:mau_lab_tech_test/domain/email_domain.dart';
import 'package:mau_lab_tech_test/domain/experience_domain.dart';
import 'package:mau_lab_tech_test/presentation/base/base_presenter.dart';
import 'package:mau_lab_tech_test/use_case/get_address_use_case.dart';
import 'package:mau_lab_tech_test/use_case/get_emails_use_case.dart';

class CandidatePresenter
    extends BasePresenter<List<Experience>, Map<String, dynamic>> {
  final GetEmailUseCase _getEmailUseCase;
  final GetAddressUseCase _getAddressUseCase;

  CandidatePresenter(
    super.useCase,
    this._getEmailUseCase,
    this._getAddressUseCase,
  );

  late Function(List<Email>) onSuccessGetEmailList;
  late Function(dynamic) onErrorGetEmailList;
  late Function() onCompleteGetEmailList;

  late Function(List<Address>) onSuccessGetAddressList;
  late Function(dynamic) onErrorGetAddressList;
  late Function() onCompleteGetAddressList;

  void onGetExperience(Map<String, dynamic> request) {
    execute(request: request);
  }

  void onGetEmailList(Map<String, dynamic> request) async {
    try {
      var data = await _getEmailUseCase.execute(request: request);
      onSuccessGetEmailList(data);
    } catch (e) {
      onErrorGetEmailList(e);
    } finally {
      onCompleteGetEmailList();
    }
  }

  void onGetAddressList(Map<String, dynamic> request) async {
    try {
      var data = await _getAddressUseCase.execute(request: request);
      onSuccessGetAddressList(data);
    } catch (e) {
      onErrorGetAddressList(e);
    } finally {
      onCompleteGetAddressList();
    }
  }
}
