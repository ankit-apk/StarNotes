import 'package:firebaselogin/controller/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthController a = Get.put(AuthController());
  double sH = 0;
  Rx<String> userId = ''.obs;
  Rx<String> password = ''.obs;
  @override
  Widget build(BuildContext context) {
    sH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/n.png',
                    height: sH * 0.22,
                  ),
                  Text(
                    "StarNotes",
                    style: TextStyle(
                        fontSize: sH * 0.06, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: sH * 0.02,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'User Name'),
                    onChanged: (userEmail) {
                      userId.value = userEmail;
                    },
                  ),
                  SizedBox(
                    height: sH * 0.02,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Password'),
                    onChanged: (userPass) {
                      password.value = userPass;
                    },
                  ),
                  SizedBox(
                    height: sH * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      a.signup(userId.toString(), password.toString());
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
