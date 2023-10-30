import 'package:flutter/material.dart';
import 'package:mini_project_flutter/theme.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 72),
        child: Column(
          children: [
            Text(
              'Register',
              style: loginTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'ShoesRack Application',
              style: textApp,
            ),
          ],
        ),
      ),
    );
  }
}
