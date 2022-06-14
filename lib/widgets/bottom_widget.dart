import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dart_flutter/home/home_page.dart';
import 'package:getx_dart_flutter/pages/expense_entry.dart';
import 'package:getx_dart_flutter/pages/profile_page.dart';
import '../pages/contact_page.dart';
import '../pages/terminal.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  int currentIndex = 0;
  List tabs = [
    const HomePage(),
    const Profile(),
    const TerminalPage(),
    const ContactPage(),
    const ExpenseEntry()
  ];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.limeAccent,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            label: "home".tr,
            icon: const Icon(Icons.home),
            //backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
            label: "Profile".tr,
            icon: const Icon(Icons.person),
            //backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
            label: "Terminal".tr,
            icon: const Icon(Icons.add_box_outlined),
          ),
          BottomNavigationBarItem(
            label: "Contact".tr,
            icon: const Icon(Icons.contact_phone_outlined),
          ),
          BottomNavigationBarItem(
            label: "Help".tr,
            icon: const Icon(Icons.help_outlined),
          ),
        ],
      ),
    );
  }
}
