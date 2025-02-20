import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          taskAppScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PIN Verification",
                  style: head1Text(colorDarkBlue),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "A 6 digit pin has been send to your mobile number",
                  style: head6Text(colorLightGray),
                ),
                SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  pinTheme: taskOTPStyle(),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                ),
                Container(
                  child: ElevatedButton(
                    style: taskAppButtonStyle(),
                    onPressed: () {},
                    child: taskAppSuccessButtonChild("Verify"),
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
