import 'package:flutter/material.dart';

void main() {
  runApp(
    ResponsiveWidgetsApp(),
  );
}

class ResponsiveWidgetsApp extends StatelessWidget {
  const ResponsiveWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveWidgetsHomeScreen(),
      title: "ResponsiveWidgetsHomeScreen",
      debugShowCheckedModeBanner: true,
    );
  }
}

class ResponsiveWidgetsHomeScreen extends StatelessWidget {
  const ResponsiveWidgetsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Responsive Widgets",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          /// Ratio -> width:height
          /// By default ratio -> 16/16
          /// 100/100
          // AspectRatio(
          //   aspectRatio: 1,
          //   //aspectRatio: 9/16,
          //   child: Container(
          //     color: Colors.red,
          //     child: Image.network("https://images.unsplash.com/photo-1555169062-013468b47731?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmlyZHxlbnwwfHwwfHx8MA%3D%3D",
          //     fit: BoxFit.cover,),
          //   ),
          // ),

          // Container(
          //   width: MediaQuery.sizeOf(context).width,
          //   height: MediaQuery.sizeOf(context).width,
          //   color: Colors.black,
          //   child: FractionallySizedBox(
          //     /// WidthFactor & HeightFactor Between 0 to 1
          //     widthFactor: 0.5,
          //     heightFactor: 0.5,
          //     child: Container(
          //       color: Colors.white,
          //     ),
          //   ),
          // ),

          /// Most Important -> Flexible and Expanded
          /// Flexible
          // Flexible(
          //   fit: FlexFit.tight,
          //     flex: 3,
          //     child: Container(
          //       color: Colors.red,
          //       width: MediaQuery.sizeOf(context).width,
          //     ),
          // ),
          // Flexible(
          //   fit: FlexFit.tight,
          //   flex: 5,
          //   child: Container(
          //     color: Colors.purple,
          //     width: MediaQuery.sizeOf(context).width,
          //   ),
          // ),
          // Flexible(
          //   flex: 1,
          //   child: Row(
          //     children: [
          //       Flexible(
          //         fit: FlexFit.tight,
          //         flex: 1,
          //         child: Container(
          //           color: Colors.white,
          //           width: MediaQuery.sizeOf(context).width,
          //         ),
          //       ),
          //       Flexible(
          //         fit: FlexFit.tight,
          //         flex: 4,
          //         child: Container(
          //           color: Colors.black,
          //           width: MediaQuery.sizeOf(context).width,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Flexible(
          //   fit: FlexFit.tight,
          //   flex: 7,
          //   child: Container(
          //     color: Colors.green,
          //     width: MediaQuery.sizeOf(context).width,
          //   ),
          // ),

          Container(
            height: 100,
            color: Colors.orange,
          ),

          /// Expanded
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: SizedBox(
                width: 100,
                height: 20,
                child: FittedBox(
                  child: Text(
                    "hjahdjsajdhdajhdkadskjdsakjdjzksj",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.lightBlueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
