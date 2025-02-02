import 'package:flutter/material.dart';

void main() {
  runApp(
    ButtonsAndInputApp(),
  );
}

class ButtonsAndInputApp extends StatelessWidget {
  const ButtonsAndInputApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ButtonsAndInputActivity(),
      debugShowCheckedModeBanner: true,
      title: "Buttons Details",
    );
  }
}

class ButtonsAndInputActivity extends StatelessWidget {
  const ButtonsAndInputActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buttons & Input App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 100,
              //color: Colors.green,
              margin: EdgeInsets.all(
                16,
              ),
              //padding: EdgeInsets.all(10,),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                //borderRadius: BorderRadius.circular(10,),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    16,
                  ),
                  bottomLeft: Radius.circular(
                    16,
                  ),
                ),
                //shape: BoxShape.circle,
              ),
              child: Text(
                "Hello",
              ),
            ),
            Container(
              margin: EdgeInsets.all(
                16,
              ),
              padding: EdgeInsets.all(
                16,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                onPressed: () {
                  print(
                    "Email has been sent.",
                  );
                },
                onLongPress: () {
                  print(
                    "Email deleted!",
                  );
                },
                child: Text(
                  "Send Email",
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(
                  fontSize: 24,
                ),
              ),
              onPressed: () {
                print("Reward sent.");
              },
              onLongPress: () {
                print("Reward granted!");
              },
              child: Text(
                "Reward",
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.red,
                size: 24,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: BorderSide(
                  color: Colors.pink,
                ),
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                print("Pressed on outline button1");
              },
              onLongPress: () {
                print("Long pressed on outline button1");
              },
              child: Text(
                "Outline Button",
              ),
            ),

            ///Input Field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  //maxLines: 5,
                  controller: TextEditingController(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.pink,
                    filled: true,
                    label: Text(
                      "Email Address",
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter your email address",
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: TextEditingController(),
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.pink,
                  filled: true,
                  label: Text(
                    "Password",
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  suffixIcon: Icon(
                    Icons.password,
                    color: Colors.white70,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
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
