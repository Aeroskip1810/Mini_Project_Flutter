import 'package:flutter/material.dart';
import 'package:mini_project_flutter/register/widget/header_register.dart';
import 'package:mini_project_flutter/register/widget/register_input.dart';
import 'package:mini_project_flutter/theme.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              const HeaderRegister(),
              RegisterInput(),
            ],
          ),
        ),
      ),
    );
  }
}
