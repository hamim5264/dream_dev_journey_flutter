import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
                Text("Your Email Address", style: head1Text(colorDarkBlue,),),
                SizedBox(height: 1,),
                Text("A 6 digit verification pin will send to your email address", style: head6Text(colorLightGray,),),
                SizedBox(height: 20,),
                TextFormField(
                  decoration:
                  taskAppInputDecoration("Email Address",),
                  cursorColor: colorGreen,
                ),
                SizedBox(height: 20,),
                Container(child: ElevatedButton(
                  style: taskAppButtonStyle(),
                  onPressed: (){},
                  child: taskAppSuccessButtonChild("Next",),
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
