import 'package:taski/features/language/views/language.dart';
import 'package:taski/features/auth/views/profile.dart';
import 'package:taski/features/auth/views/auth.dart';
import 'package:taski/features/home/home.dart';
import 'package:taski/core/routes/routes.dart';
import 'package:taski/core/auth_or_home.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return _defaultRouter(AuthOrHome());
      case Routes.home:
        return _defaultRouter(const Home());
      case Routes.auth:
        return _defaultRouter(const AuthScreen());
      case Routes.profile:
        return _defaultRouter(const Profile());
      case Routes.language:
        return _defaultRouter(const Language());
    }

    return null;
  }
}

PageRoute _defaultRouter(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
