import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

void main() {
  runApp(
    BootStrapApp(),
  );
}

class BootStrapApp extends StatelessWidget {
  const BootStrapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BootStrapActivity(),
      debugShowCheckedModeBanner: true,
      title: "Boot Strap Details",
    );
  }
}

class BootStrapActivity extends StatelessWidget {
  const BootStrapActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Boot Strap",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BootstrapContainer(
          fluid: false,
          //fluid: true,
          children: [
            BootstrapRow(
              height: 100,
              children: [
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.green,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.red,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.black,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.orange,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.pink,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.purple,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.cyan,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.lightGreen,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.grey,
                  ),
                ),
                BootstrapCol(
                  sizes: "col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6",
                  child: Container(
                    height: 100,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
