import 'package:flutter/material.dart';
import 'package:mini_project_flutter/home/home_page.dart';
import 'package:mini_project_flutter/home/profile_page.dart';
import 'package:mini_project_flutter/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cardButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: primary2Color,
        child: const Icon(Icons.add),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(0),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: primary3Color,
            currentIndex: currentIndex,
            onTap: (value) {
              // print(value);
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/home.png',
                    width: 25,
                    color: currentIndex == 0
                        ? backgroundColor
                        : const Color(0xffFFFFFF),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/profile.png',
                    width: 27,
                    color: currentIndex == 0
                        ? whiteColor
                        : const Color(0xffC1D8C3),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: cardButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // untuk mencenterkan Floating Button ke tengah
      bottomNavigationBar: customBottomNav(),
      body: () {
        switch (currentIndex) {
          case 0:
            return const HomePage();
          case 1:
            return const ProfilePage();
          default:
        }
      }(),
    );
  }
}
