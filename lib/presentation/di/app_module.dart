import 'dart:convert';

import 'package:mau_lab_tech_test/data/service/api_service.dart';
import 'package:mau_lab_tech_test/presentation/di/controller_module.dart';
import 'package:mau_lab_tech_test/presentation/di/presenter_module.dart';
import 'package:mau_lab_tech_test/presentation/di/repository_module.dart';
import 'package:mau_lab_tech_test/presentation/di/use_case_module.dart';
import 'package:mau_lab_tech_test/presentation/misc/endpoints.dart';
import 'package:mau_lab_tech_test/presentation/misc/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class AppModule {
  static Future<void> _init() async {
    var di = GetIt.I;
    di.registerLazySingleton(() => Endpoints(dotenv.env['BASE_URL'] ?? ''));

    di.registerFactory<ApiService>(() => ApiServiceImpl(di.get()));
    di.registerFactory(
      () {
        var dio = Dio();
        dio.options.connectTimeout = 60 * 1000;
        dio.options.receiveTimeout = 60 * 1000;

        var endpoints = di.get<Endpoints>();

        // use for log response and request data
        if (kDebugMode) {
          dio.interceptors.add(LogginInterceptor());
        }

        dio.options.baseUrl = endpoints.baseUrl;

        (dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
        return dio;
      },
    );
  }

  static Future<void> registerAllModules() async {
    await _init();
    ControllerModule.init();
    PresenterModule.init();
    RepositoryModule.init();
    UseCaseModule.init();
  }

  static _parseAndDecode(String response) => jsonDecode(response);
  static _parseJson(String text) => compute(_parseAndDecode, text);
}
