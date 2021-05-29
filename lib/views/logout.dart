import 'package:firebaselogin/controller/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  AuthController a = Get.put(AuthController());
  double sH = 0;
  @override
  Widget build(BuildContext context) {
    sH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.supervised_user_circle,
                    size: sH * 0.1,
                    color: Colors.white,
                  ),
                  radius: sH * 0.08,
                  backgroundColor: Colors.blue,
                ),
                SizedBox(
                  height: sH * 0.04,
                ),
                Text(
                  "${a.emailProvider()}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: sH * 0.03, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: sH * 0.04,
                ),
                ElevatedButton(
                  onPressed: () {
                    a.logout();
                  },
                  child: Text("Logout"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
