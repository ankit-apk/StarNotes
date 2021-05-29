import 'package:firebaselogin/controller/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderRow extends StatelessWidget {
  AuthController a = Get.put(AuthController());
  double sH = 0;

  @override
  Widget build(BuildContext context) {
    sH = MediaQuery.of(context).size.height;
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              a.greetingsProvider(),
              style:
                  TextStyle(fontSize: sH * 0.040, fontWeight: FontWeight.w600),
            ),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: sH * 0.040,
              child: Icon(
                Icons.supervised_user_circle,
                size: sH * 0.055,
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}

class SearchBox extends StatelessWidget {
  double sH = 0;

  @override
  Widget build(BuildContext context) {
    sH = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: sH * 0.045,
            color: Colors.black54,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                contentPadding: EdgeInsets.all(12),
                hintStyle: TextStyle(
                  fontSize: sH * 0.030,
                ),
                border: InputBorder.none,
                fillColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotesRow extends StatelessWidget {
  double sH = 0;

  @override
  Widget build(BuildContext context) {
    sH = MediaQuery.of(context).size.height;
    return Text(
      "Notes",
      style: TextStyle(fontSize: sH * 0.045, fontWeight: FontWeight.bold),
    );
  }
}
