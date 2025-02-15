import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          taskAppScreenBackground(context),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get Started With", style: head1Text(colorDarkBlue,),),
                SizedBox(height: 1,),
                Text("Learn with rabbil hasan", style: head6Text(colorLightGray,),),
                SizedBox(height: 20,),
                TextFormField(decoration: taskAppInputDecoration("Email Address",),),
                SizedBox(height: 20,),
                TextFormField(decoration: taskAppInputDecoration("Password",),),
                SizedBox(height: 20,),
                Container(child: ElevatedButton(
                  style: taskAppButtonStyle(),
                    onPressed: (){},
                    child: taskAppSuccessButtonChild("Login",),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
