import 'package:firebaselogin/controller/notes_data_controller.dart';
import 'package:firebaselogin/views/utils/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesHome extends StatefulWidget {
  @override
  _NotesHomeState createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  NotesDataController notesDataController = Get.put(NotesDataController());

  double screenHeight = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  HeaderRow(),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: screenHeight * 0.045,
                          color: Colors.black54,
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (search) {
                              notesDataController.getSearch(search);
                            },
                            decoration: InputDecoration(
                              hintText: "Search",
                              contentPadding: EdgeInsets.all(12),
                              hintStyle: TextStyle(
                                fontSize: screenHeight * 0.030,
                              ),
                              border: InputBorder.none,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: notesDataController.searchList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.dialog(
                              notesDataController.notesDialog(
                                  notesDataController.searchList[index]['Title']
                                      .toString(),
                                  notesDataController.searchList[index]['Note']
                                      .toString(),
                                  screenHeight),
                              useSafeArea: true,
                              barrierColor: Colors.black26);
                        },
                        child: Text(
                          notesDataController.searchList[index]['Title']
                              .toString(),
                        ),
                      );
                    },
                  ),
                  NotesRow(),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: notesDataController.notesList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.dialog(
                              notesDataController.notesDialog(
                                  notesDataController.notesList[index]['Title']
                                      .toString(),
                                  notesDataController.notesList[index]['Note']
                                      .toString(),
                                  screenHeight),
                              useSafeArea: true,
                              barrierColor: Colors.black26);
                        },
                        child: Card(
                          color: Colors.black12,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "${notesDataController.notesList[index]['Title'].toString()}",
                                style: TextStyle(
                                    fontSize: screenHeight * 0.030,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
