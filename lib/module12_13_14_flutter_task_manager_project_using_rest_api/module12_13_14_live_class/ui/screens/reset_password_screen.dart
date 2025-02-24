import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/data/network_caller/forget_password_manage/api_request.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/screens/login_screen.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/widgets/body_background.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/widgets/snack_message.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen(
      {super.key, required this.email, required this.otp});

  final String email;
  final String otp;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  Map<String, String> formValues = {
    "email": "",
    "OTP": "",
    "password": "",
    "cPassword": ""
  };
  bool resetPasswordInProgress = false;

  @override
  void initState() {
    callStoreData();
    super.initState();
  }

  callStoreData() async {
    String? otp = widget.otp;
    String? email = widget.email;
    inputOnChange("email", email);
    inputOnChange("OTP", otp);
  }

  inputOnChange(mapKey, textValue) {
    formValues.update(mapKey, (value) => textValue);
  }

  formOnSubmit() async {
    if (formValues["password"]!.isEmpty) {
      if (mounted) {
        showSnackMessage(context, "Password Required!", true);
      }
    } else if (formValues["password"] != formValues["cPassword"]) {
      if (mounted) {
        showSnackMessage(context, "Confirm password should be same!", true);
      }
    } else {
      resetPasswordInProgress = true;
      setState(() {});
      bool response = await setPasswordRequest(formValues); //api calling
      if (response == true) {
        if (mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false);
          showSnackMessage(context, "Password reset success.");
        }
      } else {
        resetPasswordInProgress = false;
        setState(() {});
        if (mounted) {
          showSnackMessage(context, "Request failed! try again.");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Set Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Minimum password length should be more than 8 letters",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    onChanged: (textValue) {
                      inputOnChange("password", textValue);
                    },
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onChanged: (textValue) {
                      inputOnChange("cPassword", textValue);
                    },
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: resetPasswordInProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.green,
                          color: Colors.white,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          formOnSubmit();
                        },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (route) => false);
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
