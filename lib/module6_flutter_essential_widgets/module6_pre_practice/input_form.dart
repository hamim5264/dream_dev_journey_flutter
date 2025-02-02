import 'package:flutter/material.dart';

void main() {
  runApp(
    InputFormApp(),
  );
}

class InputFormApp extends StatelessWidget {
  const InputFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputFormActivity(),
      debugShowCheckedModeBanner: true,
      title: "Input Form Details",
    );
  }
}

class InputFormActivity extends StatelessWidget {
  const InputFormActivity({super.key});

  /// Custom Toast Message
  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Custom Button Style
    ButtonStyle elevatedStyle = ElevatedButton.styleFrom(
      minimumSize: Size(
        double.infinity,
        60,
      ),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input Form App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              15.0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "First Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              15.0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Last Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              15.0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                mySnackBar("Submitted successfully.", context);
              },
              style: elevatedStyle,
              child: Text(
                "Submit",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
