import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebaselogin/views/add_note.dart';
import 'package:firebaselogin/views/logout.dart';
import 'package:firebaselogin/views/notes_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  void _onTap(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  double sH = 0;

  List pages = [NotesHome(), Logout()];
  @override
  Widget build(BuildContext context) {
    sH = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: sH * 0.048,
        ),
        onPressed: () {
          Get.to(AddNote());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapLocation: GapLocation.center,
        gapWidth: sH * 0.048,
        iconSize: sH * 0.048,
        icons: [Icons.grid_4x4, Icons.account_circle],
        activeIndex: activeIndex,
        onTap: _onTap,
      ),
      body: pages[activeIndex],
    );
  }
}
