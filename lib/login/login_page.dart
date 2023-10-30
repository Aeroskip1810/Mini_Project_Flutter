import 'package:flutter/material.dart';
import 'package:mini_project_flutter/login/widget/email_input.dart';
import 'package:mini_project_flutter/login/widget/header_login.dart';
import 'package:mini_project_flutter/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              const HeaderLogin(),
              EmailInput(),
            ],
          ),
        ),
      ),
    );
  }
}
