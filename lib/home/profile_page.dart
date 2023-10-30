// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project_flutter/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
  Map<String, dynamic>? userData;

  final Dio dio = Dio();

  Future<void> fetchUserData() async {
    try {
      final response = await dio
          .get("https://crud-75ac9-default-rtdb.firebaseio.com/profile.json");

      if (response.statusCode == 200) {
        setState(() {
          userData = response.data;
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load user data');
    }
  }

  void selectImage() async {
    XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Uint8List img = await pickedImage.readAsBytes();
      setState(() {
        _image = img;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: addTitle,
        ),
        backgroundColor: primary3Color,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: primary2Color),
                          ),
                          child: const CircleAvatar(
                            radius: 64,
                            backgroundImage: AssetImage('assets/imageprof.png'),
                          ),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                        color: primary3Color,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              if (userData != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(
                            'Username',
                            style: profileTitle,
                          ),
                          trailing: Text(
                            '${userData?["username"] ?? "No username"}',
                            style: subtitle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          leading: const Icon(Icons.email),
                          title: Text(
                            'E-mail',
                            style: profileTitle,
                          ),
                          trailing: Text(
                            '${userData?["email"] ?? "No email"}',
                            style: subtitle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary2Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.pushNamed(context, '/');
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
