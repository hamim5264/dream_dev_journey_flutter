import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MediaQueryAndLayoutBuilderApp(),
  );
}

class MediaQueryAndLayoutBuilderApp extends StatelessWidget {
  const MediaQueryAndLayoutBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: "MediaQuery And Layout Builder Widgets",
      debugShowCheckedModeBanner: true,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    // Size size = MediaQuery.sizeOf(context);
    //
    // print(size);
    // print(size.width);
    // print(size.height);
    // print(size.aspectRatio);
    // print(size.flipped);

    //Orientation orientation = MediaQuery.orientationOf(context);
    //print(orientation);

    // List<DisplayFeature> displayFeatures = MediaQuery.displayFeaturesOf(context);
    // print(displayFeatures);
    // print(MediaQuery.devicePixelRatioOf(context));

    print(MediaQuery.platformBrightnessOf(context));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Responsive Widgets",
        ),
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        print(constraints.maxWidth);

        if (constraints.maxWidth > 500) {
          return Center(
            child: Text("Too big screen"),
          );
        }
        return Center(
          child: OrientationBuilder(builder: (context, orientation) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(orientation == Orientation.portrait
                    ? "Portrait"
                    : "Landscape"),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    Text(
                      "asfererqeqfdwqfwferqfeqfqfdaf",
                    ),
                    Text(
                      "dejfh nsdknksn jfooisdjfoi kodsnfjsdjoisjio nsiodfjj",
                    ),
                    Text("snkshifsd"),
                  ],
                ),
              ],
            );
          }),
        );
      }),
    );
  }
}
