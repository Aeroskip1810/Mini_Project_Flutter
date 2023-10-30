import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mini_project_flutter/firestore.dart';
import 'package:mini_project_flutter/theme.dart';

class RegisterInput extends StatelessWidget {
  RegisterInput({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 151),
          child: TextFormField(
            controller: usernameController,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Username',
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          child: TextFormField(
            controller: emailController,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'E-mail',
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          child: TextFormField(
            controller: passwordController,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
            ),
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Password',
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 65),
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text)
                  .then((value) {
                print("Created New Account");
                Navigator.pushNamed(context, '/login');
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primary3Color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              'Register',
              style: GoogleFonts.poppins(
                  color: backgroundColor, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: GoogleFonts.poppins(
                  color: primary2Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Sign in',
                  style: GoogleFonts.poppins(
                      color: whiteColor, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
