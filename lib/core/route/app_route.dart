import 'package:calculator_ion_mobility/module/main/pages/main_page.dart';
import 'package:flutter/material.dart';

import 'route_constant.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.mainPage:
        return MaterialPageRoute(builder: (_) => const MainPage());
      default:
        return MaterialPageRoute(builder: (_) => const MainPage());
    }
  }
}
