import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flu_bloc_boilerplate/features/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flu_bloc_boilerplate/features/presentation/routes/app_routes.dart';
import 'package:flu_bloc_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:flu_bloc_boilerplate/features/presentation/utils/app_theme.dart';
import './injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di
      .init(); //Inject all the dependencies and wait for it is done (i.e. UI won't built until all the dependencies are injected)
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of the application.
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
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initial,
        // routes: AppRoutes.appRoutes,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
