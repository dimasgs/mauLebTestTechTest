import 'package:mau_lab_tech_test/presentation/pages/blog/blog_page.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/args.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/candidate_page.dart';
import 'package:mau_lab_tech_test/presentation/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../pages/blog/args.dart';

class Router {
  late RouteObserver<PageRoute> routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic>? getRoute(RouteSettings? settings) {
    var di = GetIt.I;

    switch (settings?.name) {
      case HomePage.route:
        return _buildRoute(settings, HomePage(controller: di.get()));
      case CandidatePage.route:
        var arguments = settings?.arguments as CandidateDetailArguments;
        return _buildRoute(settings,
            CandidatePage(controller: di.get(), arguments: arguments));
      case BlogPage.route:
        var arguments = settings?.arguments as BlogDetailArguments;
        return _buildRoute(
            settings, BlogPage(controller: di.get(), arguments: arguments));

      default:
        return null;
    }
  }

  PageRouteBuilder _buildRoute(RouteSettings? settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: page,
            );
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
