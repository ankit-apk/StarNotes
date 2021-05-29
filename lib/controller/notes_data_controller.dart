import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaselogin/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotesDataController extends GetxController {
  var notesList = List.empty(growable: true).obs;
  var searchList = List.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  addNotes(String title, String description) async {
    Map<String, dynamic> demoData = {
      "Title": title.toString(),
      "Note": description.toString(),
    };
    CollectionReference c =
        FirebaseFirestore.instance.collection(GetStorage().read("status"));
    c.doc(title).set(demoData);
  }

  getSearch(String query) async {
    FirebaseFirestore.instance
        .collection(GetStorage().read("status"))
        .where('Title', isEqualTo: query)
        .get()
        .then((value) => searchList.value = value.docs);
  }

  getNotes() async {
    CollectionReference c =
        FirebaseFirestore.instance.collection(GetStorage().read("status"));
    c.snapshots().listen((notes) {
      notesList.value = notes.docs;
    });
  }

  deleteNote(String title) async {
    CollectionReference c =
        FirebaseFirestore.instance.collection(GetStorage().read("status"));
    c.doc(title).delete();
  }

  notesDialog(String title, String note, double sH) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.yellow.shade200),
              height: sH * 0.6,
              width: sH * 0.5,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    note,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: sH * 0.028),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    deleteNote(title);
                    Get.offAll(Home());
                  },
                  child: Icon(Icons.delete),
                ),
                SizedBox(
                  width: sH * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterClipboard.copy(note);

                    Get.snackbar("Copied", "Text copied to clipboard",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.blue,
                        colorText: Colors.white);
                  },
                  child: Icon(Icons.copy),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
