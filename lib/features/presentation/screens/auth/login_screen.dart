import 'package:flutter/material.dart';
import 'package:flu_bloc_boilerplate/features/presentation/components/shared/shared.dart';
import 'package:flu_bloc_boilerplate/features/presentation/components/widgets/app_logo.dart';
import 'package:flu_bloc_boilerplate/features/presentation/screens/main/bottom_tab.dart';
import 'package:flu_bloc_boilerplate/features/presentation/utils/common.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class LoginScreen extends StatefulWidget {
  static const route_name = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: gradientBackgroundDecoration,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      _buildTopButton(),
                      SizedBox(
                        height: 12,
                      ),
                      const AppLogo(),
                      _buildForm(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTopButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.help),
          label: Text("Help"),
        ),
      ],
    );
  }

  Column _buildForm() {
    return Column(
      children: [
        CustomInput(
          label: "Email",
        ),
        SizedBox(
          height: 12,
        ),
        CustomInput(
          label: "Kata laluan",
        ),
        SizedBox(
          height: 24,
        ),
        CustomButton(
          label: "LOGIN",
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              BottomTab.route_name,
            );
          },
        )
      ],
    );
  }
}
