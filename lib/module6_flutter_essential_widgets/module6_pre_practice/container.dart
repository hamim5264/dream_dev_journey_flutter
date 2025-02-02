import 'package:flutter/material.dart';

void main() {
  runApp(
    ContainerApp(),
  );
}

class ContainerApp extends StatelessWidget {
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContainerActivity(),
      debugShowCheckedModeBanner: true,
      title: "Container Details",
    );
  }
}

class ContainerActivity extends StatelessWidget {
  const ContainerActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ContainerApp",
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: 200,
        width: 200,
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(
          30,
        ),
        // margin: EdgeInsets.fromLTRB(
        //   20,
        //   30,
        //   20,
        //   30,
        // ),
        padding: EdgeInsets.all(
          40,
        ),
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            color: Colors.black,
            width: 5,
          ),
        ),
        child: Image.network(
          "https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zmx1dHRlcnxlbnwwfHwwfHx8MA%3D%3D",
        ),
      ),
    );
  }
}
