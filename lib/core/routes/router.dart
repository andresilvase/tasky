import 'package:tasky/features/language/views/language.dart';
import 'package:tasky/core/widgets/auth_or_profile.dart';
import 'package:tasky/features/auth/views/auth.dart';
import 'package:tasky/features/home/home.dart';
import 'package:tasky/core/routes/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _defaultRouter(const Home());
      case Routes.auth:
        return _defaultRouter(const AuthScreen());
      case Routes.profile:
        return _defaultRouter(const AuthOrProfile());
      case Routes.language:
        return _defaultRouter(Language());
    }

    return null;
  }
}

PageRoute _defaultRouter(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
