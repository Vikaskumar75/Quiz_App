import 'package:flutter/material.dart';

import '../../app_page.dart';
import '../authentication/authentication_screen.dart';

class Routes extends NavigatorObserver {
  static List<Route<dynamic>> routeStack = <Route<dynamic>>[];

  static const String appPage = '/';
  static const String authScreen = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case appPage:
        return _GenerateRoute(
          child: const AppPage(),
          routeName: settings.name!,
        );
      case authScreen:
        return _GenerateRoute(
          child: const AuthenticationScreen(),
          routeName: settings.name!,
        );
      default:
        return _GenerateRoute(
          child: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          routeName: settings.name!,
        );
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    routeStack.removeLast();
    if (newRoute != null) {
      routeStack.add(newRoute);
    }
  }
}

class _GenerateRoute extends PageRouteBuilder<RouteSettings> {
  final Widget child;
  final String routeName;
  _GenerateRoute({
    required this.child,
    required this.routeName,
  }) : super(
          settings: RouteSettings(
            name: routeName,
          ),
          pageBuilder: (_, __, ___) => child,
        );
}
