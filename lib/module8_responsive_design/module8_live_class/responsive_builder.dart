import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(
    ResponsiveBuilderApp(),
  );
}

class ResponsiveBuilderApp extends StatelessWidget {
  const ResponsiveBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (BuildContext context) {
        return MaterialApp(
          home: ResponsiveBuilderHomeScreen(),
          title: "ResponsiveBuilder",
          debugShowCheckedModeBanner: true,
        );
      }
    );
  }
}

class ResponsiveBuilderHomeScreen extends StatelessWidget {
  const ResponsiveBuilderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Responsive Builder",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ResponsiveBuilder(builder: (context,sizeInformation){
        return Center(
          child: Text(sizeInformation.deviceScreenType.toString(),
          style: TextStyle(
            fontSize: 10.sw
          ),
          ),
        );
      },
      ),
    );
  }
}
