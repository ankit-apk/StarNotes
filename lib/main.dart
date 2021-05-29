import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/controller/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthController a = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.leftToRightWithFade,
        home: a.pageProvider());
  }
}
