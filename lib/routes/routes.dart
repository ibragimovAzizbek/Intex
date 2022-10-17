import 'package:flutter/material.dart';

import '../views/home/home_view.dart';

class RouteCont {
  static final RouteCont _inherentce = RouteCont._init();

  static RouteCont get inherentce => _inherentce;

  RouteCont._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeView());
    }
  }
}
