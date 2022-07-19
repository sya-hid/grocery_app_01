import 'package:flutter/material.dart';
import 'package:grocery_app_01/constants.dart';
import 'package:grocery_app_01/pages/homePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentMenu = 0;
  Widget body() {
    switch (currentMenu) {
      case 0:
        return const HomePage();
      case 1:
        return const Center(child: Text('Data'));
      case 3:
        return const Center(child: Text('Message'));
      case 4:
        return const Center(child: Text('Profile'));
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentMenu,
          selectedItemColor: darkblue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentMenu = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined_rounded), label: ''),
            BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: const Icon(
                      Icons.qr_code_scanner_outlined,
                      color: Colors.white,
                    )),
                label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded), label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded), label: ''),
          ]),
    );
  }
}
