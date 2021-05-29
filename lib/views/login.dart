import 'package:firebaselogin/controller/notes_controller.dart';
import 'package:firebaselogin/views/forgot_password.dart';
import 'package:firebaselogin/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double sH = 0;
  AuthController a = Get.put(AuthController());

  Rx<String> email = ''.obs;
  Rx<String> password = ''.obs;

  @override
  Widget build(BuildContext context) {
    sH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
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
                    onChanged: (useremail) {
                      email.value = useremail;
                    },
                  ),
                  SizedBox(
                    height: sH * 0.02,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Password'),
                    onChanged: (userpassword) {
                      password.value = userpassword;
                    },
                  ),
                  SizedBox(
                    height: sH * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      a.login(email.toString(), password.toString());
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(
                    height: sH * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(SignUp());
                    },
                    child: Text("Register"),
                  ),
                  SizedBox(
                    height: sH * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(ForgotPassword());
                    },
                    child: Text("Forgot Password"),
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
