import 'package:flutter/material.dart';

void main(){
  runApp(const TestApp(),);
}
class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestAppHomeScreen(),
      title: "Testing Materials For App.",
      debugShowCheckedModeBanner: true,
    );
  }
}

class TestAppHomeScreen extends StatelessWidget {
  const TestAppHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Application,", style: TextStyle(color: Colors.white,),),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Image.network("https://images.unsplash.com/photo-1511993226957-cd166aba52d8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDZ8eGpQUjRobGtCR0F8fGVufDB8fHx8fA%3D%3D",
        height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
