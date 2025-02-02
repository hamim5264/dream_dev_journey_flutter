import 'package:flutter/material.dart';

void main() {
  runApp(
    NavigationApp(),
  );
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationActivity(),
      debugShowCheckedModeBanner: true,
      title: "Navigation Details",
    );
  }
}

class NavigationActivity extends StatelessWidget {
  const NavigationActivity({super.key});

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
        100,
        50,
      ),
      backgroundColor: Colors.amber,
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
          "Navigation App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageActivity1(
                          "From home to activity 1",
                        ),
                      ),
                    );
                  },
                  style: elevatedStyle,
                  child: Text(
                    "Go to activity1",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageActivity2(
                          "From home to activity 2",
                        ),
                      ),
                    );
                  },
                  style: elevatedStyle,
                  child: Text(
                    "Go to activity2",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PageActivity1 extends StatelessWidget {
  String msg;

  PageActivity1(this.msg, {super.key});

  @override
  Widget build(BuildContext context) {
    /// Custom Button Style
    ButtonStyle elevatedStyle = ElevatedButton.styleFrom(
      minimumSize: Size(
        100,
        50,
      ),
      backgroundColor: Colors.amber,
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
          msg,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageActivity2(
                  "From activity 1 to 2",
                ),
              ),
            );
          },
          style: elevatedStyle,
          child: Text(
            "Go to activity2",
          ),
        ),
      ),
    );
  }
}

class PageActivity2 extends StatelessWidget {
  String msg;

  PageActivity2(this.msg, {super.key});

  @override
  Widget build(BuildContext context) {
    /// Custom Button Style
    ButtonStyle elevatedStyle = ElevatedButton.styleFrom(
      minimumSize: Size(
        100,
        50,
      ),
      backgroundColor: Colors.amber,
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
          msg,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationActivity(),
              ),
            );
          },
          style: elevatedStyle,
          child: Text(
            "Go to HomePage",
          ),
        ),
      ),
    );
  }
}
