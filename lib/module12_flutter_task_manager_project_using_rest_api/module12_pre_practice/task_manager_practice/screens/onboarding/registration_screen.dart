import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          taskAppScreenBackground(context),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Text("Join With Us", style: head1Text(colorDarkBlue),),
                  SizedBox(height: 1,),
                  Text("Learn with rabbil hasan", style: head6Text(colorLightGray),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: taskAppInputDecoration("Email Address"),cursorColor: colorGreen,),
                  SizedBox(height: 20,),
                  TextFormField(decoration: taskAppInputDecoration("First Name"),cursorColor: colorGreen,),
                  SizedBox(height: 20,),
                  TextFormField(decoration: taskAppInputDecoration("Last Name"),cursorColor: colorGreen,),
                  SizedBox(height: 20,),
                  TextFormField(decoration: taskAppInputDecoration("Mobile"),cursorColor: colorGreen,),
                  SizedBox(height: 20,),
                  TextFormField(decoration: taskAppInputDecoration("Password"),cursorColor: colorGreen,),
                  SizedBox(height: 20,),
                  TextFormField(decoration: taskAppInputDecoration("Confirm Password"),cursorColor: colorGreen,),
                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      style: taskAppButtonStyle(),
                        onPressed: (){},
                        child: taskAppSuccessButtonChild("Registration",),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
