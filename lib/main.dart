import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flu_bloc_boilerplate/core/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flu_bloc_boilerplate/features/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flu_bloc_boilerplate/features/presentation/routes/app_routes.dart';
import 'package:flu_bloc_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:flu_bloc_boilerplate/features/presentation/utils/app_theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import './injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di
      .init(); //Inject all the dependencies and wait for it is done (i.e. UI won't built until all the dependencies are injected)

  await SentryFlutter.init(
    (options) => options.dsn = sentryDsnKey,
    appRunner: () => runApp(App()),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
            repository: di.sl<AuthRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: appTheme(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initial,
        // routes: AppRoutes.appRoutes,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
