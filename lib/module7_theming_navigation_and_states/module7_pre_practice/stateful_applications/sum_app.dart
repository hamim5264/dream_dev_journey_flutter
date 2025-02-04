import 'package:dream_dev_journey_flutter/module7_theming_navigation_and_states/module7_pre_practice/stateful_applications/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    SumApplication(),
  );
}

class SumApplication extends StatelessWidget {
  const SumApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sum Application",
      home: ApplicationHomePage(),
    );
  }
}

class ApplicationHomePage extends StatefulWidget {
  const ApplicationHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ApplicationHomePageUI();
  }
}

class ApplicationHomePageUI extends State<ApplicationHomePage> {
  double sum = 0.0;
  Map<String, double> formValue = {
    "num1": 0.0,
    "num2": 0.0,
    "num3": 0.0,
  };

  @override
  Widget build(BuildContext context) {
    ///Updating map values
    myInputOnChange(inputKey, inputValue) {
      setState(() {
        formValue.update(inputKey, (value) => double.parse(inputValue));
      });
    }

    ///Adding all numbers
    addAllNumbers() {
      setState(() {
        sum = formValue["num1"]! + formValue["num2"]! + formValue["num3"]!;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sum Application",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Sum is: $sum",
              style: headTextStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) {
                myInputOnChange("num1", value);
              },
              decoration: appInputDecoration("First Number"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) {
                myInputOnChange("num2", value);
              },
              decoration: appInputDecoration("Second Number"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) {
                myInputOnChange("num3", value);
              },
              decoration: appInputDecoration("Third Number"),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: appButtonStyle(),
                onPressed: () {
                  addAllNumbers();
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
