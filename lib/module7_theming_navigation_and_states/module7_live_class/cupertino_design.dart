import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CupertinoDesignApp(),
  );
}

class CupertinoDesignApp extends StatelessWidget {
  const CupertinoDesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeScreen(),
      title: "Cupertino Design",
      debugShowCheckedModeBanner: true,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white70,
      navigationBar: CupertinoNavigationBar(
        leading: Icon(
          CupertinoIcons.home,
        ),
        middle: Text(
          "Home Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        trailing: CupertinoSwitch(
          value: true,
          onChanged: (bool onChange) {},
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello World",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            CupertinoButton(
              child: Text(
                "Tap Here",
              ),
              onPressed: () {},
            ),
            CupertinoButton.filled(
              child: Text(
                "Tap Here",
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 5,
            ),
            CupertinoButton.tinted(
              child: Text(
                "Tap Here",
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 5,
            ),
            CupertinoTextField(
              placeholder: "TextField",
            ),
            SizedBox(
              height: 5,
            ),
            CupertinoTabBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.settings,
                  ),
                  label: "Settings",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.search,
                  ),
                  label: "Search",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
