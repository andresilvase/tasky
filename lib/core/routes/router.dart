import 'package:taski/features/auth/views/auth.dart';
import 'package:taski/features/home/home.dart';
import 'package:taski/core/routes/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _defaultRouter(const Home());
      case Routes.auth:
        return _defaultRouter(const AuthScreen());
    }

    return null;
  }
}

PageRoute _defaultRouter(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
