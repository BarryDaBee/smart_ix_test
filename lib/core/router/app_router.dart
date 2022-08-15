import 'package:flutter/material.dart';
import 'package:smart_home/features/dashboard/presentation/pages/pages.dart';

class AppRouter {
  const AppRouter._();

  static const initialRoute = DashboardPage.routeName;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DashboardPage.routeName:
        return _route(const DashboardPage());
      case DeviceDetailsPage.routeName:
        return _route(const DeviceDetailsPage());
      default:
        return _route(const Scaffold());
    }
  }

  ///Decorates the [child] with a MaterialPageRoute
  static PageRoute<dynamic> _route(Widget child) {
    return MaterialPageRoute(
      builder: (context) {
        return child;
      },
    );
  }
}
