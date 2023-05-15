import 'package:mau_lab_tech_test/presentation/base/base_use_case.dart';
import 'package:flutter/foundation.dart';

abstract class BasePresenter<DOMAIN, REQUEST> {
  late final BaseUseCase<DOMAIN, REQUEST> _useCase;

  BasePresenter(this._useCase);

  late void Function(DOMAIN) onSuccess;
  late void Function(dynamic) onError;
  late void Function() onComplete;

  @protected
  void execute({required REQUEST request}) async {
    try {
      var data = await _useCase.execute(request: request);
      onSuccess(data);
    } catch (e) {
      onError(e);
    } finally {
      onComplete();
    }
  }
}
