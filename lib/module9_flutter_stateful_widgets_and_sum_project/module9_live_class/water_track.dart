import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    WaterTrackerApp(),
  );
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHomeScreen(),
      title: "Water Tracker",
      debugShowCheckedModeBanner: true,
    );
  }
}

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppHomeScreenState();
  }
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  final TextEditingController _amountOfGlassTEController =
      TextEditingController(text: "1");
  List<WaterTrack> waterConsumeList = [];
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Water Tracker",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Consume",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text("$totalAmount",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(),
                        controller: _amountOfGlassTEController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          int amount = int.tryParse(
                                  _amountOfGlassTEController.text.trim()) ??
                              1;
                          totalAmount += amount;
                          WaterTrack waterTrack =
                              WaterTrack(DateTime.now(), amount);
                          waterConsumeList.add(waterTrack);
                          setState(() {});
                          _amountOfGlassTEController.clear();
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: waterConsumeList.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onLongPress: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  "Delete",
                                ),
                                content: const Text(
                                  "Do you want to delete?",
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        totalAmount = totalAmount -
                                            waterConsumeList[index].noOfGlass;
                                        waterConsumeList.removeAt(index);
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "No",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )),
                                ],
                              );
                            });
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      title: Text(
                        DateFormat("HH:mm:ss dd-MM-yyyy")
                            .format(waterConsumeList[index].time),
                      ),
                      trailing: Text(
                        "${waterConsumeList[index].noOfGlass}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class WaterTrack {
  final DateTime time;
  final int noOfGlass;

  WaterTrack(this.time, this.noOfGlass);
}
