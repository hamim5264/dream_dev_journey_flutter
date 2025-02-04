import 'package:flutter/material.dart';

void main() {
  runApp(
    ThemingApp(),
  );
}

class ThemingApp extends StatelessWidget {
  const ThemingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: "Theming Details",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        //primaryColor: Colors.lightGreen,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 5,
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.6,
                wordSpacing: 0.5),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            foregroundColor: Colors.green,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          elevation: 5,
          shadowColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 18,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
          ),
          bodyLarge: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber,
          elevation: 5,
          shadowColor: Colors.amberAccent,
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Theming App",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello World",
            ),
            Text(
              "Hello Flutter",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              "Hello Dart",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Hello Dart",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Tap Here",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Tap Here",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
