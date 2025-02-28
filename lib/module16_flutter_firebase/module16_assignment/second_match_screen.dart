import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondMatchScreen extends StatefulWidget {
  const SecondMatchScreen({super.key});

  @override
  State<SecondMatchScreen> createState() => _SecondMatchScreenState();
}

class _SecondMatchScreenState extends State<SecondMatchScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference match2CollectionRef =
      firebaseFirestore.collection("Italy vs Span");
  List<Match2> match2List = [];

  Future<void> getMatch1ListData() async {
    match2List.clear();
    final QuerySnapshot result = await match2CollectionRef.get();
    for (QueryDocumentSnapshot element in result.docs) {
      Match2 match2 = Match2(element.id, element.get("2"), element.get("Time"),
          element.get("Total Time"));
      match2List.add(match2);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Italy vs Span",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: RefreshIndicator(
        onRefresh: getMatch1ListData,
        child: StreamBuilder(
            stream: match2CollectionRef.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.hasData) {
                match2List.clear();
                for (QueryDocumentSnapshot element in snapshot.data!.docs) {
                  Match2 match2 = Match2(element.id, element.get("2"),
                      element.get("Time"), element.get("Total Time"));
                  match2List.add(match2);
                }
              }
              return ListView.builder(
                  itemCount: match2List.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(
                              match2CollectionRef.path.toString(),
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Text(
                                "2 : ${match2List[index].goal}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Time : ${match2List[index].time}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Total Time : ${match2List[index].totalTime}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

class Match2 {
  final String id;
  final String goal;
  final String time;
  final String totalTime;

  Match2(this.id, this.goal, this.time, this.totalTime);
}
