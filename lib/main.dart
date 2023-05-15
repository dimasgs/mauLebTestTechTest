import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:mau_lab_tech_test/presentation/di/app_module.dart';
import 'package:mau_lab_tech_test/presentation/misc/router.dart'
    as custom_router;

import 'presentation/pages/home/home_page.dart';

void main() {
  _initApp().then((_) {
    runZonedGuarded<Future<void>>(
      () async {
        runApp(MyApp());
      },
      (error, stack) {
        print("error init $error");
      },
    );
  });
}

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
    await AppModule.registerAllModules();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  } catch (e, stackTrace) {
    if (kDebugMode) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
    }
  }
}

class MyApp extends StatelessWidget {
  late final custom_router.Router _router = custom_router.Router();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bimbit Pembina',
      debugShowCheckedModeBanner: false,
      home: HomePage(controller: GetIt.I.get()),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }
}
