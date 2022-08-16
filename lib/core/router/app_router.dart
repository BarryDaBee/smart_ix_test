import 'package:flutter/material.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/presentation/pages/pages.dart';

class AppRouter {
  const AppRouter._();

  static const initialRoute = HomePage.routeName;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return _route(const HomePage());
      case DeviceDetailsPage.routeName:
        final device = settings.arguments! as DeviceEntity;
        return _route(
          DeviceDetailsPage(
            device: device,
          ),
        );
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
