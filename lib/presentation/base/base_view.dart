// ignore_for_file: no_logic_in_create_state

import 'package:mau_lab_tech_test/presentation/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BasePage<Controller extends BaseController>
    extends StatefulWidget {
  final Controller controller;

  late final globalKey = GlobalKey<State<StatefulWidget>>();

  BasePage({required this.controller, Key? key}) : super(key: null);

  @protected
  Widget get view;

  @override
  State<StatefulWidget> createState() {
    return _BaseViewState<Controller>(
      controller: controller,
      view: view,
      key: globalKey,
    );
  }
}

class _BaseViewState<Controller extends BaseController>
    extends _ViewState<BasePage<Controller>, Controller> {
  late final Widget _view;
  late final GlobalKey<State<StatefulWidget>> key;

  _BaseViewState({
    required Controller controller,
    required Widget view,
    required GlobalKey<State<StatefulWidget>> key,
  }) : super(controller: controller, key: key) {
    _view = view;
  }

  @override
  @protected
  Widget get view => _view;
}

abstract class _ViewState<Page extends StatefulWidget,
    Controller extends BaseController> extends State<Page> {
  late final Controller controller;

  _ViewState({
    required this.controller,
    required GlobalKey<State<StatefulWidget>> key,
  }) {
    controller.initController(key);
    WidgetsBinding.instance.addObserver(controller);
  }

  Widget get view;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Controller>.value(
      value: controller,
      child: view,
    );
  }

  @override
  void initState() {
    super.initState();
    controller.onInitState();
  }

  @override
  @mustCallSuper
  void dispose() {
    controller.dispose();
    WidgetsBinding.instance.removeObserver(controller);
    super.dispose();
  }
}

typedef ControlledBuilder<Controller extends BaseController> = Widget Function(
  BuildContext context,
  Controller controller,
);

class ControlledWidgetBuilder<Controller extends BaseController>
    extends StatelessWidget {
  final ControlledBuilder<Controller> builder;

  const ControlledWidgetBuilder({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (BuildContext context, Controller controller, _) => builder(
        context,
        controller,
      ),
    );
  }
}
