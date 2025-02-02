import 'package:flutter/material.dart';

void main() {
  runApp(
    ButtonApp(),
  );
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ButtonsActivity(),
      debugShowCheckedModeBanner: true,
      title: "Buttons Details",
    );
  }
}

class ButtonsActivity extends StatelessWidget {
  const ButtonsActivity({super.key});

  ///Toast Message
  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ///Buttons Style
    ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(
        10,
      ),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
    );

    ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      padding: EdgeInsets.all(
        10,
      ),
      //backgroundColor: Colors.green,
      foregroundColor: Colors.black,
      side: BorderSide(
        color: Colors.green,
        width: 2,
      ),
    );
    ButtonStyle textButtonStyle = TextButton.styleFrom(
      padding: EdgeInsets.all(
        10,
      ),
      foregroundColor: Colors.green,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buttons App",
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  mySnackBar(
                    "Tapped on text button.",
                    context,
                  );
                },
                style: textButtonStyle,
                child: Text(
                  "Text Button",
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              mySnackBar(
                "Tapped on elevated button.",
                context,
              );
            },
            style: elevatedButtonStyle,
            child: Text(
              "Elevated Button",
            ),
          ),
          OutlinedButton(
            onPressed: () {
              mySnackBar(
                "Tapped on outlined button.",
                context,
              );
            },
            style: outlineButtonStyle,
            child: Text(
              "Outlined Button",
            ),
          ),
        ],
      ),
    );
  }
}
