import 'package:flutter/material.dart';

void main() {
  runApp(
    NavigationDrawerApp(),
  );
}

class NavigationDrawerApp extends StatelessWidget {
  const NavigationDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawerActivity(),
    );
  }
}

class DrawerActivity extends StatelessWidget {
  const DrawerActivity({super.key});

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Drawers",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),

      ///Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Dream Dev",
                ),
                accountEmail: Text(
                  "DreamDevJourney26jan@gmail.com",
                ),
                currentAccountPicture: Image.network(
                  "https://cdn3d.iconscout.com/3d/free/thumb/free-flutter-3d-icon-download-in-png-blend-fbx-gltf-file-formats--android-logo-google-dart-coding-lang-pack-logos-icons-7577998.png?f=webp",
                ),
                currentAccountPictureSize: Size.square(
                  45,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                onDetailsPressed: () {
                  mySnackBar("Tapped on profile.", context);
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text(
                "Home",
              ),
              onTap: () {
                mySnackBar("Tapped on Home", context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_phone,
              ),
              title: Text(
                "Contact",
              ),
              onTap: () {
                mySnackBar("Tapped on Contact", context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: Text(
                "Profile",
              ),
              onTap: () {
                mySnackBar("Tapped on Profile", context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.email,
              ),
              title: Text(
                "Email",
              ),
              onTap: () {
                mySnackBar("Tapped on Email", context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.call,
              ),
              title: Text(
                "Phone",
              ),
              onTap: () {
                mySnackBar("Tapped on Phone", context);
              },
            ),
          ],
        ),
      ),

      ///End Drawer -> swipe from right side.
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Dream Dev",
                ),
                accountEmail: Text(
                  "DreamDevJourney26jan@gmail.com",
                ),
                currentAccountPicture: Image.network(
                  "https://cdn3d.iconscout.com/3d/free/thumb/free-flutter-3d-icon-download-in-png-blend-fbx-gltf-file-formats--android-logo-google-dart-coding-lang-pack-logos-icons-7577998.png?f=webp",
                ),
                currentAccountPictureSize: Size.square(
                  45,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                onDetailsPressed: () {
                  mySnackBar("Tapped on profile.", context);
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text(
                "Home",
              ),
              onTap: () {
                mySnackBar("Tapped on Home", context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_phone,
              ),
              title: Text(
                "Contact",
              ),
              onTap: () {
                mySnackBar("Tapped on Contact", context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: Text(
                "Profile",
              ),
              onTap: () {
                mySnackBar("Tapped on Profile", context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.email,
              ),
              title: Text(
                "Email",
              ),
              onTap: () {
                mySnackBar("Tapped on Email", context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.call,
              ),
              title: Text(
                "Phone",
              ),
              onTap: () {
                mySnackBar("Tapped on Phone", context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
