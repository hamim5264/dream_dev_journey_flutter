import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                Text("Set Password", style: head1Text(colorDarkBlue,),),
                SizedBox(height: 1,),
                Text("Minimum length password 8 character with letter and number combination", style: head6Text(colorLightGray,),),
                SizedBox(height: 20,),
                TextFormField(
                  decoration:
                  taskAppInputDecoration("Password",),
                  cursorColor: colorGreen,
                ),
                SizedBox(height: 20,),
                TextFormField(decoration: taskAppInputDecoration("Confirm Password",),cursorColor: colorGreen,),
                SizedBox(height: 20,),
                Container(child: ElevatedButton(
                  style: taskAppButtonStyle(),
                  onPressed: (){},
                  child: taskAppSuccessButtonChild("Confirm",),
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
