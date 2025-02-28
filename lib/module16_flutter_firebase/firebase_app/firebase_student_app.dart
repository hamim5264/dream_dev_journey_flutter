import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_dev_journey_flutter/module16_flutter_firebase/firebase_messaging_service/firebase_messaging_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessagingService().initialize();
  await FirebaseMessagingService().getFCMToken();
  await FirebaseMessagingService().subscribeToTopic("Dream-Dev-Journey");
  await FirebaseMessagingService().onRefresh((token) {
    /// Send to api
  });
  runApp(
    FirebaseApplication(),
  );
}

class FirebaseApplication extends StatelessWidget {
  const FirebaseApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OstadStudentList(),
      title: "Firebase Application",
      debugShowCheckedModeBanner: true,
    );
  }
}

class OstadStudentList extends StatefulWidget {
  const OstadStudentList({super.key});

  @override
  State<OstadStudentList> createState() => _OstadStudentListState();
}

class _OstadStudentListState extends State<OstadStudentList> {
  List<OstadStudents> studentList = [];
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference studentCollectionRef =
      firebaseFirestore.collection("ostadStudents");
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _rollTEController = TextEditingController();

  Future<void> getStudentsData() async {
    studentList.clear();
    final QuerySnapshot result = await studentCollectionRef.get();
    //print(result.size);
    for (QueryDocumentSnapshot element in result.docs) {
      //print(element.data());
      //print(element.get("name"));
      OstadStudents ostadStudents = OstadStudents(element.get("name"),
          int.tryParse(element.get("roll").toString()) ?? 0, element.id);
      studentList.add(ostadStudents);
    }
    if (mounted) {
      setState(() {});
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getStudentsData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student App Firebase",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: RefreshIndicator(
        onRefresh: getStudentsData,
        color: Colors.blue,
        child: StreamBuilder(
            stream: studentCollectionRef
                .orderBy("roll", descending: false)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.hasData) {
                studentList.clear();
                for (QueryDocumentSnapshot element in snapshot.data!.docs) {
                  OstadStudents ostadStudents = OstadStudents(
                      element.get("name"),
                      int.tryParse(element.get("roll").toString()) ?? 0,
                      element.id);
                  studentList.add(ostadStudents);
                }

                return ListView.builder(
                    itemCount: studentList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              studentList[index].roll.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text(
                            studentList[index].name,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () {
                                  studentCollectionRef
                                      .doc(studentList[index].id)
                                      .update({
                                    "name": "Dream Dev",
                                    "roll": 100,
                                    "Extra": {
                                      "no": 15,
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  studentCollectionRef
                                      .doc(studentList[index].id)
                                      .delete();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return const SizedBox();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showAddStudentBottomSheet();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void showAddStudentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameTEController,
                ),
                TextField(
                  controller: _rollTEController,
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () async {
                      await studentCollectionRef.add({
                        "name": _nameTEController.text.trim(),
                        "roll":
                            int.tryParse(_rollTEController.text.trim()) ?? 0,
                      });

                      // await studentCollectionRef.doc("454-4554-559").set({
                      //   "name": _nameTEController.text.trim(),
                      //   "roll":
                      //   int.tryParse(_rollTEController.text.trim()) ?? 0,
                      // });

                      _nameTEController.clear();
                      _rollTEController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _nameTEController.dispose();
    _rollTEController.dispose();
  }
}

class OstadStudents {
  final String name;
  final int roll;
  final String id;

  OstadStudents(this.name, this.roll, this.id);
}
