import 'dart:async';

import 'package:flu_bloc_boilerplate/features/presentation/bloc/authentication/bloc.dart';
import 'package:flu_bloc_boilerplate/features/presentation/screens/auth/login_screen.dart';
import 'package:flu_bloc_boilerplate/features/presentation/screens/main/bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:flu_bloc_boilerplate/features/presentation/components/widgets/app_logo.dart';
import 'package:flu_bloc_boilerplate/features/presentation/utils/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const route_name = "/";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      BlocProvider.of<AuthenticationBloc>(context).add(
        CheckSessionEvent(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticatedState) {
              Navigator.of(context).pushReplacementNamed(
                BottomTab.route_name,
              );
            } else if (state is UnauthenticatedState) {
              Navigator.of(context)
                  .pushReplacementNamed(LoginScreen.route_name);
            }
          },
          child: Container(
            width: double.infinity,
            decoration: gradientBackgroundDecoration,
            padding: const EdgeInsets.only(
              bottom: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                const AppLogo(),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
