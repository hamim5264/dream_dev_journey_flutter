import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_pre_practice/navigate_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGetXAppHome extends StatelessWidget {
  const MyGetXAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GetX Practice",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// SnackBar
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Practice GetX",
                  "Hello, getX",
                  showProgressIndicator: true,
                  progressIndicatorBackgroundColor: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.pinkAccent,
                  colorText: Colors.white,
                  borderRadius: 2,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  icon: const Icon(
                    Icons.adb,
                    color: Colors.white,
                  ),
                  isDismissible: false,
                  duration: Duration(
                    seconds: 5,
                  ),
                  animationDuration: Duration(
                    milliseconds: 1500,
                  ),
                );
              },
              child: const Text(
                "GetX SnackBar",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),

            /// Dialog
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Delete",
                    titlePadding: const EdgeInsets.all(10),
                    titleStyle: TextStyle(
                      color: Colors.black,
                    ),
                    middleText: "Once you delete you can't get it back.",
                    middleTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.pinkAccent,
                    radius: 10,
                    textConfirm: "Confirm",
                    confirmTextColor: Colors.white,
                    textCancel: "Cancel",
                    cancelTextColor: Colors.white,
                    onCancel: () {
                      Get.back(
                        closeOverlays: true,
                      );
                    },
                    onConfirm: () {
                      Get.back(
                        closeOverlays: true,
                      );
                    },
                    barrierDismissible: false,
                    content: Column(
                      children: [
                        Text(
                          "Hello Dart",
                        ),
                        Text(
                          "Hello Flutter",
                        ),
                        Text(
                          "Hello Flutter",
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  "GetX Dialog",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),

            /// Bottom Sheet
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.pinkAccent,
                      child: Column(
                        children: [
                          Text(
                            "Hello Dart",
                          ),
                          Text(
                            "Hello Flutter",
                          ),
                          Text(
                            "Hello Flutter",
                          ),
                          TextButton(
                            onPressed: () => Get.back(
                              closeOverlays: true,
                            ),
                            child: Text(
                              "Close",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    enableDrag: true,
                    isDismissible: false,
                    barrierColor: Colors.black54);
              },
              child: Text(
                "GetX Bottom Sheet",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),

            /// Navigation
            ElevatedButton(
                onPressed: () {
                  Get.to(NavigatePage());
                  // Get.off(NavigatePage()); //--> Clear Single Routing History
                  //Get.offAll(NavigatePage()); //--> Clear All Routing History
                },
                child: Text(
                  "Go to Navigate Page",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
