import 'package:flutter/material.dart';

void main() {
  runApp(
    ListTileAndDividerApp(),
  );
}

class ListTileAndDividerApp extends StatelessWidget {
  const ListTileAndDividerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListTileAndDividerActivity(),
      debugShowCheckedModeBanner: true,
      title: "ListTile And Divider Details",
    );
  }
}

class ListTileAndDividerActivity extends StatelessWidget {
  const ListTileAndDividerActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Tile & Divider",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Scrollbar(
        thickness: 15,
          radius: Radius.circular(15),
          child: ListView(
            children: [
              ListTile(
                title: Text("User name",),
                subtitle: Text("User25@gmail.com",),
                leading: Icon(Icons.person,),
                trailing: Icon(Icons.arrow_forward_sharp,),
                onTap: (){
                  print("Tapped on profile");
                },
              ),
              Divider(
                height: 10,
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: Colors.pink,
              ),
              ListTile(
                title: Text("User name",),
                subtitle: Text("User25@gmail.com",),
                leading: Icon(Icons.person,),
                trailing: Icon(Icons.arrow_forward_sharp,),
                onTap: (){
                  print("Tapped on profile");
                },
              ),
              Divider(
                height: 10,
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: Colors.pink,
              ),
              ListTile(
                title: Text("User name",),
                subtitle: Text("User25@gmail.com",),
                leading: Icon(Icons.person,),
                trailing: Icon(Icons.arrow_forward_sharp,),
                onTap: (){
                  print("Tapped on profile");
                },
              ),
              Divider(
                height: 10,
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: Colors.pink,
              ),
              ListTile(
                title: Text("User name",),
                subtitle: Text("User25@gmail.com",),
                leading: Icon(Icons.person,),
                trailing: Icon(Icons.arrow_forward_sharp,),
                onTap: (){
                  print("Tapped on profile");
                },
              ),
              Divider(
                height: 10,
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: Colors.pink,
              ),
              ListTile(
                title: Text("User name",),
                subtitle: Text("User25@gmail.com",),
                leading: Icon(Icons.person,),
                trailing: Icon(Icons.arrow_forward_sharp,),
                onTap: (){
                  print("Tapped on profile");
                },
              ),

            ],
          ),
      ),
    );
  }
}
