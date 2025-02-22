import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/api/api_clients.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/utility/task_utilities.dart';
import 'package:flutter/material.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  Map<String, String> formValues = {
    "email": "",
    "OTP": "",
    "password": "",
    "confirmPassword": "",
  };
  bool isLoading = false;

  @override
  void initState() {
    callStoredData();
    super.initState();
  }

  callStoredData() async {
    String? otp = await readUserData("OTPVerification");
    String? email = await readUserData("EmailVerification");
    inputOnChange("email", email);
    inputOnChange("OTP", otp);
  }

  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues["password"]!.isEmpty) {
      taskAppErrorToast("Password required!");
    } else if (formValues["password"] != formValues["confirmPassword"]) {
      taskAppErrorToast("Confirm password should be same");
    } else {
      setState(() {
        isLoading = true;
      });
      bool res = await setPasswordRequest(formValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
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
                          "Set Password",
                          style: head1Text(
                            colorDarkBlue,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Minimum length password 8 character with letter and number combination",
                          style: head6Text(
                            colorLightGray,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: taskAppInputDecoration(
                            "Password",
                          ),
                          cursorColor: colorGreen,
                          onChanged: (textValue) {
                            inputOnChange("password", textValue);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: taskAppInputDecoration(
                            "Confirm Password",
                          ),
                          cursorColor: colorGreen,
                          onChanged: (textValue) {
                            inputOnChange("confirmPassword", textValue);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: ElevatedButton(
                            style: taskAppButtonStyle(),
                            onPressed: () {
                              formOnSubmit();
                            },
                            child: taskAppSuccessButtonChild(
                              "Confirm",
                            ),
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
