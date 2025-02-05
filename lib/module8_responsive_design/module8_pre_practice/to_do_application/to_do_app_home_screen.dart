import 'package:dream_dev_journey_flutter/module8_responsive_design/module8_pre_practice/to_do_application/style.dart';
import 'package:flutter/material.dart';

class ToDoHomeScreen extends StatefulWidget {
  const ToDoHomeScreen({super.key});

  @override
  State<ToDoHomeScreen> createState() => _ToDoHomeScreenState();
}

class _ToDoHomeScreenState extends State<ToDoHomeScreen> {
  List toDoList = [];
  String toDoItems = "";

  toDoInputOnChange(content) {
    setState(() {
      toDoItems = content;
    });
  }

  addItems() {
    setState(() {
      toDoList.add({"item": toDoItems});
    });
  }

  removeItems(index) {
    toDoList.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 60,
                    child: TextFormField(
                      onChanged: (content) {
                        toDoInputOnChange(content);
                      },
                      decoration: appInputDecoration(
                        "List Item",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      flex: 40,
                      child: ElevatedButton(
                        style: appButtonStyle(),
                        onPressed: () {
                          addItems();
                        },
                        child: Text("Add"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 90,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: toDoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: sizedBox50(
                        Row(
                          children: [
                            Expanded(
                              flex: 70,
                              child: Text(
                                toDoList[index]["item"].toString(),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 20,
                              child: TextButton(
                                onPressed: () {
                                  removeItems(index);
                                },
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
