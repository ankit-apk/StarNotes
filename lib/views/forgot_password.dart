import 'package:firebaselogin/controller/notes_controller.dart';
import 'package:firebaselogin/views/forgot_password.dart';
import 'package:firebaselogin/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  double sH = 0;
  AuthController a = Get.put(AuthController());

  Rx<String> email = ''.obs;
  TextEditingController _controller = TextEditingController();

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
                    controller: _controller,
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
                  ElevatedButton(
                    onPressed: () {
                      a.reset(email.value);
                      _controller.clear();
                      Get.snackbar('Please check your mail',
                          'Please check your mail for further steps.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.blue,
                          colorText: Colors.white);
                    },
                    child: Text("Send Email"),
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
