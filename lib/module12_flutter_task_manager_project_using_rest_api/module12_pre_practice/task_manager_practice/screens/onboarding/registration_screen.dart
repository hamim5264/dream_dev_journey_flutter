import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/api/api_clients.dart';
import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map<String, String> formValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "photo": "",
    "confirmPassword": "",
  };
  bool isLoading = false;

  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues["email"]!.isEmpty) {
      taskAppErrorToast("Email required.");
    } else if (formValues["firstName"]!.isEmpty) {
      taskAppErrorToast("First name required.");
    } else if (formValues["lastName"]!.isEmpty) {
      taskAppErrorToast("Last name required.");
    } else if (formValues["mobile"]!.isEmpty) {
      taskAppErrorToast("Mobile number required.");
    } else if (formValues["password"]!.isEmpty) {
      taskAppErrorToast("Mobile number required.");
    } else if (formValues["password"] != formValues["confirmPassword"]) {
      taskAppErrorToast("Confirm password should be same.");
    } else {
      setState(() {
        isLoading = true;
      });
      bool registration = await registrationRequest(formValues);
      if (registration == true) {
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
                    child: const CircularProgressIndicator(
                      color: colorGreen,
                    ),
                  ))
                : (SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Join With Us",
                            style: head1Text(colorDarkBlue),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            "Learn with rabbil hasan",
                            style: head6Text(colorLightGray),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("email", textValue);
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: taskAppInputDecoration("Email Address"),
                            cursorColor: colorGreen,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("firstName", textValue);
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: taskAppInputDecoration("First Name"),
                            cursorColor: colorGreen,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("lastName", textValue);
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: taskAppInputDecoration("Last Name"),
                            cursorColor: colorGreen,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("mobile", textValue);
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: taskAppInputDecoration("Mobile"),
                            cursorColor: colorGreen,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("password", textValue);
                            },
                            textInputAction: TextInputAction.next,
                            decoration: taskAppInputDecoration("Password"),
                            cursorColor: colorGreen,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("confirmPassword", textValue);
                            },
                            textInputAction: TextInputAction.done,
                            decoration:
                                taskAppInputDecoration("Confirm Password"),
                            cursorColor: colorGreen,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: taskAppButtonStyle(),
                            onPressed: () {
                              formOnSubmit();
                            },
                            child: taskAppSuccessButtonChild(
                              "Registration",
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
          ),
        ],
      ),
    );
  }
}
