import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/colors.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/ui/state_managers/button_controllers.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/ui/state_managers/sign_up_controller.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';

import '../widgets/screen_background.dart';
import 'log_in_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final ButtonController controller = Get.put(ButtonController());
  final SignupController signupController = Get.put(SignupController());
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
      child: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimateList(
              interval: 30.ms,
              effects: [
                const ScaleEffect(curve: Curves.easeInOut),
                ShimmerEffect(
                    delay: 1200.ms, color: mainColor.shade100.withOpacity(0.35))
              ],
              children: [
                Text(
                  'Join With Us',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).primaryTextTheme.titleLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  cursorColor: mainColor,
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                      hintText: 'Email', labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter Email!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  cursorColor: mainColor,
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(
                      hintText: 'First Name', labelText: 'First Name'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your First Name!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  cursorColor: mainColor,
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                      hintText: 'Last Name', labelText: 'Last Name'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Last Name!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  cursorColor: mainColor,
                  controller: _mobileTEController,
                  decoration: const InputDecoration(
                      hintText: 'Mobile', labelText: 'Mobile'),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Mobile Number!';
                    }
                    if (value!.length < 11) {
                      return 'Mobile Number is not valid!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  cursorColor: mainColor,
                  controller: _passwordTEController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            _isObscureText = !_isObscureText;
                            setState(() {});
                          },
                          icon: Icon(
                            _isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: mainColor.shade200,
                          ))),
                  obscureText: _isObscureText,
                  // onEditingComplete: userSignup,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter Password!';
                    }
                    if (value!.length < 8) {
                      return 'Password length must be 8 or more!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => CustomButton(
                    buttonText: "Sign Up",
                    isBtnLoading: controller.isBtnLoading.value,
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      FocusScope.of(context).unfocus();

                      controller.isBtnLoading.value =
                          true; // Set loading state to true

                      try {
                        bool signUpResult = await signupController.userSignup(
                          _emailTEController.text.trim(),
                          _firstNameTEController.text.trim(),
                          _lastNameTEController.text.trim(),
                          _mobileTEController.text.trim(),
                          _passwordTEController.text,
                        );

                        if (signUpResult) {
                          Get.offAll(() => const LoginScreen());
                          Get.snackbar(
                            'Success',
                            'Sign Up Successful!',
                            backgroundColor: mainColor,
                            colorText: Colors.white,
                          );
                        } else {
                          Get.snackbar(
                            'Failed',
                            'Sign Up Failed! Try again.',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      } catch (e) {
                        print('Error occurred: $e');
                      } finally {
                        controller.isBtnLoading.value = false;
                      }
                    },
                  ),
                ),
                signInButton(context)
              ],
            )),
      ),
    ));
  }

  Row signInButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Have account? "),
        TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            'Sign In',
            style: TextStyle(color: Color(0xFF0C9B4B)),
          ),
        ),
      ],
    );
  }
}
