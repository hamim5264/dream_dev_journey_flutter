import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_dev_journey_flutter/module16_flutter_firebase/module16_assignment/fisrt_match_screen.dart';
import 'package:dream_dev_journey_flutter/module16_flutter_firebase/module16_assignment/second_match_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MatchListApp(),
  );
}

class MatchListApp extends StatelessWidget {
  const MatchListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MatchListHomeScreen(),
    );
  }
}

class MatchListHomeScreen extends StatefulWidget {
  const MatchListHomeScreen({super.key});

  @override
  State<MatchListHomeScreen> createState() => _MatchListHomeScreenState();
}

class _MatchListHomeScreenState extends State<MatchListHomeScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference match1CollectionRef =
      firebaseFirestore.collection("Argentina vs Africa");
  late CollectionReference match2CollectionRef =
      firebaseFirestore.collection("Italy vs Span");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Match List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(match1CollectionRef.path.toString()),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FirstMatchScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(match2CollectionRef.path.toString()),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondMatchScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
