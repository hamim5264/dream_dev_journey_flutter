import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/api/api_clients.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/utility/task_utilities.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  Map<String, String> formValues = {"otp": ""};
  bool isLoading = false;

  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues["otp"]!.length != 6) {
      taskAppErrorToast("6 digit pin required!");
    } else {
      setState(() {
        isLoading = true;
      });
      String? emailAddress = await readUserData("EmailVerification");
      bool res = await verifyOTPRequest(emailAddress, formValues["otp"]);
      if (res == true) {
        Navigator.pushNamed(context, "/setPassword");
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          taskAppScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: isLoading
                ? (Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ))
                : SingleChildScrollView(
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
                          onChanged: (value) {
                            inputOnChange("otp", value);
                          },
                        ),
                        Container(
                          child: ElevatedButton(
                            style: taskAppButtonStyle(),
                            onPressed: () {
                              formOnSubmit();
                            },
                            child: taskAppSuccessButtonChild("Verify"),
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
