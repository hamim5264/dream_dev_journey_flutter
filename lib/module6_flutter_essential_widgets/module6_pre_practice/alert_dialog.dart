import 'package:flutter/material.dart';

void main() {
  runApp(
    AlertDialogApp(),
  );
}

class AlertDialogApp extends StatelessWidget {
  const AlertDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlertDialogActivity(),
      debugShowCheckedModeBanner: true,
      title: "Alert Dialog Details",
    );
  }
}

class AlertDialogActivity extends StatelessWidget {
  const AlertDialogActivity({super.key});

  /// Custom Alert Dialog
  myAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text(
                "Alert Dialog",
              ),
              content: Text(
                "Do you want to delete?",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    mySnackBar("Deleted successfully.", context);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

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
      padding: EdgeInsets.all(
        10,
      ),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alert Dialog App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Icon(
          Icons.add_alert_rounded,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            myAlertDialog(context);
          },
          style: elevatedStyle,
          child: Text(
            "Click Here!",
          ),
        ),
      ),
    );
  }
}
