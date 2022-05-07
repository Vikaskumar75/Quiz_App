import 'package:flutter/material.dart';
import 'package:quiz_app/src/app/app_page.dart';
import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';

import '../authentication/authentication_screen.dart';
import '../quiz_detail/view/quiz_detail.dart';
import '../quiz_home/view/quiz_home.dart';

class Navigation extends NavigatorObserver {
  static List<Route<dynamic>> routeStack = <Route<dynamic>>[];

  static const String appPage = '/';
  static const String authScreen = '/login';
  static const String quizHome = '/quiz-home';
  static const String quizDetails = '/quiz-details';

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
      case quizHome:
        return _GenerateRoute(
          child: const QuizHome(),
          routeName: settings.name!,
        );
      case quizDetails:
        return _GenerateRoute(
          child: QuizDetails(
            quiz: settings.arguments as Quiz,
          ),
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
            transitionDuration: const Duration(milliseconds: 150),
            reverseTransitionDuration: const Duration(milliseconds: 150),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> primary,
              Animation<double> secondary,
              Widget child,
            ) {
              return SlideTransition(
                position: primary.drive(_offset),
                child: child,
              );
            },
            pageBuilder: (
              BuildContext context,
              Animation<double> primary,
              Animation<double> secondary,
            ) {
              return child;
            });

  static final Tween<Offset> _offset = Tween<Offset>(
    begin: const Offset(1.0, 0),
    end: Offset.zero,
  );
}
