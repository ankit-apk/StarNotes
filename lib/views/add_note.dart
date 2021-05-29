import 'package:firebaselogin/controller/notes_data_controller.dart';
import 'package:firebaselogin/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  NotesDataController n = Get.put(NotesDataController());
  Rx<String> title = ''.obs;
  Rx<String> description = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.black12,
                    child: Row(
                      children: [
                        Icon(
                          Icons.title,
                          size: 30,
                          color: Colors.black54,
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (userTitle) {
                              title.value = userTitle;
                            },
                            decoration: InputDecoration(
                              hintText: "Title",
                              contentPadding: EdgeInsets.all(12),
                              hintStyle: TextStyle(fontSize: 20),
                              border: InputBorder.none,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.black12,
                    height: 250,
                    child: Row(
                      children: [
                        Icon(
                          Icons.description,
                          size: 30,
                          color: Colors.black54,
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (userDescription) {
                              description.value = userDescription;
                            },
                            decoration: InputDecoration(
                              hintText: "Search",
                              contentPadding: EdgeInsets.all(12),
                              hintStyle: TextStyle(fontSize: 20),
                              border: InputBorder.none,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      n.addNotes(title.toString(), description.toString());
                      Get.offAll(Home());
                    },
                    child: Icon(Icons.add),
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
