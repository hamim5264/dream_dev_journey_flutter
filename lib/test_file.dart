import 'package:flutter/material.dart';

void main() {
  runApp(
    const TestApp(),
  );
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestAppHomeSplashScreen(),
      theme: ThemeData(
        useMaterial3: false,
      ),
      title: "Testing Materials For App.",
      debugShowCheckedModeBanner: true,
    );
  }
}

class TestAppHomeSplashScreen extends StatelessWidget {
  const TestAppHomeSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 5)).then((value) {
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (context) => HomeScreen()),
    //       (route) => false);
    // });

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Test Application,",
          ),
          //backgroundColor: Color.fromRGBO(145, 104, 224, 1)
        ),
        body: Center(
          //child: Image.network("https://images.unsplash.com/photo-1511993226957-cd166aba52d8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDZ8eGpQUjRobGtCR0F8fGVufDB8fHx8fA%3D%3D",
          child: Image.asset(
            "images/demo2.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ));
  }
}
//       body: Stack(
//         children: [
//           Image.asset(
//             "images/demo2.jpg",
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.fitHeight,
//           ),
//           Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 300,
//                 width: 300,
//                 child: Image.asset(
//                   "images/QuizCrafter Logo v1.0.1.png",
//                 ),
//               ),
//               Text(
//                 "QuizCrafter",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "poppins",
//                   color: Colors.purpleAccent,
//                 ),
//               )
//             ],
//           )),
//         ],
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: Text("Home screen"),
//       )),
//     );
//   }
// }
