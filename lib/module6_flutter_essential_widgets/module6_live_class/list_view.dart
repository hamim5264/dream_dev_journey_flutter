import 'package:flutter/material.dart';

void main() {
  runApp(
    ListViewApp(),
  );
}

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewActivity(),
      debugShowCheckedModeBanner: true,
      title: "List View Details",
    );
  }
}

class ListViewActivity extends StatelessWidget {
  const ListViewActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List View",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      // body: Scrollbar(
      //   thickness: 10,
      //     radius: Radius.circular(15),
      //     child: SingleChildScrollView(
      //       scrollDirection: Axis.vertical,
      //       child: Column(
      //         children: [
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //           Text("Hello World",style: TextStyle(fontSize: 20,),),
      //
      //         ],
      //       ),
      //     ),
      // ),

      body: Scrollbar(
        thickness: 10,
        radius: Radius.circular(
          15,
        ),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "User name",
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
