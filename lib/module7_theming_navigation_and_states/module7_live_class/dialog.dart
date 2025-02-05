import 'package:flutter/material.dart';

void main() {
  runApp(
    DialogApp(),
  );
}

class DialogApp extends StatelessWidget {
  const DialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: "Dialog Details",
      debugShowCheckedModeBanner: true,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dialog",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Alert",
                      ),
                      content: Text(
                        "You are in danger!",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Ok",
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Show Alert Dialog",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Dialog App",
                  applicationIcon: Icon(
                    Icons.adb,
                  ),
                  applicationVersion: "1.0.4",
                  children: [
                    Text("This application is for practice purpose only.")
                  ],
                );
              },
              child: Text(
                "Show About Dialog",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
