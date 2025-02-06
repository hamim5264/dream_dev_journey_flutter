import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    DevicePreview(
        enabled: kDebugMode, // we can use true/false here
        //enabled: kReleaseMode,
        builder: (context) {
          return DevicePreviewApp();
        }),
  );
}

/// With ResponsiveApp
// class DevicePreviewApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveApp(
//         builder: (BuildContext context){
//           return MaterialApp(
//             locale: DevicePreview.locale(context),
//             builder: DevicePreview.appBuilder,
//             home: DevicePreviewHomeScreen(),
//           );
//         }
//     );
//   }
// }

/// With Sizer
class DevicePreviewApp extends StatelessWidget {
  const DevicePreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      print(deviceType);
      return MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: DevicePreviewHomeScreen(),
      );
    });
  }
}

class DevicePreviewHomeScreen extends StatelessWidget {
  const DevicePreviewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DevicePreview"),
        centerTitle: true,
      ),
      body: ResponsiveBuilder(builder: (context, sizeInformation) {
        return Center(
          child: Text(
            sizeInformation.deviceScreenType.toString(),
            style: TextStyle(
              fontSize: 25.sp, //for sizer
              //fontSize: 25, //so sp for ResponsiveApp
            ),
          ),
        );
      }),
    );
  }
}
