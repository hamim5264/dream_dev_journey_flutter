import 'package:flutter/material.dart';

void main() {
  runApp(
    BuilderApp(),
  );
}

class BuilderApp extends StatelessWidget {
  const BuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuilderActivity(),
      debugShowCheckedModeBanner: true,
      title: "Builder Details",
    );
  }
}

class BuilderActivity extends StatelessWidget {
  BuilderActivity({super.key});

  List<String> students = [
    "Hamim",
    "Leon",
    "Rafat",
    "Meraz",
    "Rabbil",
    "Hasan",
    "Rakib",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Builders",
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

        ///GridView Builder
        // child: GridView.builder(
        //   itemCount: 100,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
        //     itemBuilder: (context, index){
        //       return Column(
        //         children: [
        //           Text(index.toString(),),
        //           Icon(Icons.adb,),
        //         ],
        //       );
        //     }
        // ),

        ///ListView Builder
        // child: ListView.builder(
        //   itemCount: 100,
        //     itemBuilder: (context, index){
        //     return ListTile(
        //       title: Text("item no $index",),
        //     );
        //     }
        // ),

        ///ListView Separator
        //   child: ListView.separated(
        //       itemCount: 100,
        //       itemBuilder: (context, index){
        //         return ListTile(
        //           title: Text("item no $index",),
        //         );
        //       },
        //       separatorBuilder: (context, index){
        //         return Column(
        //           children: [
        //             Text(index.toString(),),
        //             Divider(),
        //           ],
        //         );
        // },
        //   ),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                students[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: students.length,
        ),
      ),
    );
  }
}
