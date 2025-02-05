import 'package:flutter/material.dart';

void main() {
  runApp(
    BottomSheetApp(),
  );
}

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: "Bottom Sheet Details",
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
          "Bottom Sheet",
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
                showModalBottomSheet(
                  isDismissible: false,
                  barrierColor: Colors.black45,
                  backgroundColor: Colors.grey.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            "This is bottom sheet",
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text(
                "Show Bottom Sheet",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
