import 'package:flu_bloc_boilerplate/features/presentation/screens/auth/login_screen.dart';
import 'package:flu_bloc_boilerplate/features/presentation/screens/main/bottom_tab.dart';
import 'package:flu_bloc_boilerplate/features/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initial = SplashScreen.route_name;

  static final appRoutes = {
    SplashScreen.route_name: (context) => SplashScreen(),
    LoginScreen.route_name: (context) => LoginScreen(),
    BottomTab.route_name: (context) => BottomTab(),
  };

  static Route<dynamic> onGenerateRoutes(routeSettings) {
    Widget page = SizedBox();
    switch (routeSettings.name) {
      case SplashScreen.route_name:
        page = SplashScreen();
        break;
      case LoginScreen.route_name:
        page = LoginScreen();
        break;
      case BottomTab.route_name:
        page = BottomTab();
        break;
      /**
         * Navigate screen with param
         */
      // case Screen.route_name:
      //   final String args = routeSettings.arguments as String;
      //   return Screen(
      //     date: args,
      //   );
      default:
        print("ROUTE NOT HANDLED");
        page = SizedBox();
    }
    // return MaterialPageRoute(builder: (context) {
    //   return page;
    // });
    // Custom transition, if want to use default, uncomment above line
    return _slideUpRoute(page);
  }

  static PageRouteBuilder _slideUpRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      // transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  static PageRouteBuilder _fadeInRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      // transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
      transitionDuration: Duration(milliseconds: 500),
    );
  }
}
