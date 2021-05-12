import 'package:flu_bloc_boilerplate/features/presentation/screens/auth/login_screen.dart';
import 'package:flu_bloc_boilerplate/features/presentation/screens/main/bottom_tab.dart';
import 'package:flu_bloc_boilerplate/features/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const initial = SplashScreen.route_name;
  static const unauth_initial = LoginScreen.route_name;
  static const auth_initial = BottomTab.route_name;

  static final appRoutes = {
    SplashScreen.route_name: (context) => SplashScreen(),
    LoginScreen.route_name: (context) => LoginScreen(),
    BottomTab.route_name: (context) => BottomTab(),
  };
}
