import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirstMatchScreen extends StatefulWidget {
  const FirstMatchScreen({super.key});

  @override
  State<FirstMatchScreen> createState() => _FirstMatchScreenState();
}

class _FirstMatchScreenState extends State<FirstMatchScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference match1CollectionRef =
      firebaseFirestore.collection("Argentina vs Africa");
  List<Match1> match1List = [];

  Future<void> getMatch1ListData() async {
    match1List.clear();
    final QuerySnapshot result = await match1CollectionRef.get();
    for (QueryDocumentSnapshot element in result.docs) {
      Match1 match1 = Match1(element.id, element.get("4"), element.get("Time"),
          element.get("Total Time"));
      match1List.add(match1);
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
          "Arg vs Africa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: RefreshIndicator(
        onRefresh: getMatch1ListData,
        color: Colors.blue,
        child: StreamBuilder(
            stream: match1CollectionRef.snapshots(),
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
                match1List.clear();
                for (QueryDocumentSnapshot element in snapshot.data!.docs) {
                  Match1 match1 = Match1(element.id, element.get("4"),
                      element.get("Time"), element.get("Total Time"));
                  match1List.add(match1);
                }
              }
              return ListView.builder(
                  itemCount: match1List.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(
                              match1CollectionRef.path.toString(),
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Text(
                                "4 : ${match1List[index].goal}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Time : ${match1List[index].time}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Total Time : ${match1List[index].totalTime}",
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

class Match1 {
  final String id;
  final String goal;
  final String time;
  final String totalTime;

  Match1(this.id, this.goal, this.time, this.totalTime);
}
