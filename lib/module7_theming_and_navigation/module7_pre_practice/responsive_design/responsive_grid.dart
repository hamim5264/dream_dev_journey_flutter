import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() {
  runApp(
    ResponsiveGridApp(),
  );
}

class ResponsiveGridApp extends StatelessWidget {
  const ResponsiveGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveGridActivity(),
      debugShowCheckedModeBanner: true,
      title: "Responsive Grid Details",
    );
  }
}

class ResponsiveGridActivity extends StatelessWidget {
  const ResponsiveGridActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Responsive Grid",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ResponsiveGridRow(
          children: [
            // ResponsiveGridCol(
            //   lg: 12,
            //     child: Container(
            //       height: 100,
            //       color: Colors.green,
            //     ),
            // ),
            // ResponsiveGridCol(
            //   xl:4, lg: 6, md: 8, sm: 9, xs: 12,
            //   child: Container(
            //     height: 100,
            //     color: Colors.red,
            //   ),
            // ),
            ResponsiveGridCol(
              xl: 3,
              lg: 3,
              md: 4,
              sm: 6,
              xs: 12,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            ResponsiveGridCol(
              xl: 3,
              lg: 3,
              md: 4,
              sm: 6,
              xs: 12,
              child: Container(
                height: 100,
                color: Colors.blue,
              ),
            ),
            ResponsiveGridCol(
              xl: 3,
              lg: 3,
              md: 4,
              sm: 6,
              xs: 12,
              child: Container(
                height: 100,
                color: Colors.black,
              ),
            ),
            ResponsiveGridCol(
              xl: 3,
              lg: 3,
              md: 4,
              sm: 6,
              xs: 12,
              child: Container(
                height: 100,
                color: Colors.orange,
              ),
            ),
            ResponsiveGridCol(
              xl: 3,
              lg: 3,
              md: 4,
              sm: 6,
              xs: 12,
              child: Container(
                height: 100,
                color: Colors.cyan,
              ),
            ),
            ResponsiveGridCol(
              xl: 3,
              lg: 3,
              md: 4,
              sm: 6,
              xs: 12,
              child: Container(
                height: 100,
                color: Colors.purple,
              ),
            ),
            ResponsiveGridCol(
              xl: 3,
              lg: 3,
              md: 4,
              sm: 6,
              xs: 12,
              child: Container(
                height: 100,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
