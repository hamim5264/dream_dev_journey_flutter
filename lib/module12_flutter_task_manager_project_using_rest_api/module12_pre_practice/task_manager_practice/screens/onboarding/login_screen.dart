import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/api/api_clients.dart';
import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> formValues = {"email": "", "password": ""};
  bool isLoading = false;

  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues["email"]!.isEmpty) {
      taskAppErrorToast("Email required.");
    } else if (formValues["password"]!.isEmpty) {
      taskAppErrorToast("Password required.");
    } else {
      setState(() {
        isLoading = true;
      });
      bool response = await logInRequest(formValues);
      if (response == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/newTaskList", (route) => false);
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
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get Started With",
                          style: head1Text(
                            colorDarkBlue,
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Learn with rabbil hasan",
                          style: head6Text(
                            colorLightGray,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: taskAppInputDecoration(
                            "Email Address",
                          ),
                          cursorColor: colorGreen,
                          onChanged: (textValue) {
                            inputOnChange("email", textValue);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          decoration: taskAppInputDecoration(
                            "Password",
                          ),
                          cursorColor: colorGreen,
                          onChanged: (textValue) {
                            inputOnChange("password", textValue);
                          },
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
                            "Login",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/emailVerification");
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: head7Text(colorLightGray),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/registration");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: head7Text(colorDarkBlue),
                                    ),
                                    Text(
                                      "Sign Up",
                                      style: head7Text(colorGreen),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
          ),
        ],
      ),
    );
  }
}
