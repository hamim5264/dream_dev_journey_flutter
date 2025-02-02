import 'package:flutter/material.dart';

void main() {
  runApp(
    RowContainerApp(),
  );
}

class RowContainerApp extends StatelessWidget {
  const RowContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContainerActivity(),
      debugShowCheckedModeBanner: true,
      title: "Row Container Details",
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
          "Row ContainerApp",
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.network(
              "https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zmx1dHRlcnxlbnwwfHwwfHx8MA%3D%3D",
            ),
          ),
          Container(
            height: 100,
            width: 100,
            child: Image.network(
              "https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zmx1dHRlcnxlbnwwfHwwfHx8MA%3D%3D",
            ),
          ),
          Container(
            height: 100,
            width: 100,
            child: Image.network(
              "https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zmx1dHRlcnxlbnwwfHwwfHx8MA%3D%3D",
            ),
          ),
        ],
      ),
    );
  }
}
