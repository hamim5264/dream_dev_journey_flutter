import 'dart:async';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/data/network_caller/network_caller.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/data/network_caller/network_response.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/data/utilities/urls.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/screens/reset_password_screen.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/widgets/body_background.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  final String email;

  const PinVerificationScreen({super.key, required this.email});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _pinVerifyInProgress = false;
  Timer? _timer;
  int _remainingTime = 120;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      "Pin Verification",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text("A 6 digit OTP has been sent to ${widget.email}.",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        )),
                    const SizedBox(height: 24),
                    PinCodeTextField(
                      controller: _pinTEController,
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      backgroundColor: Colors.transparent,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldWidth: 40,
                        fieldHeight: 40,
                        activeFillColor: Colors.white,
                        activeColor: Colors.green,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) => true,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text("Time remaining: $_remainingTime sec",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          )),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: !_pinVerifyInProgress,
                        replacement: const Center(
                            child: CircularProgressIndicator(
                          color: Colors.green,
                        )),
                        child: ElevatedButton(
                          onPressed: _remainingTime > 0 ? _verifyOTP : null,
                          child: const Text("Verify",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _verifyOTP() async {
    // print("Entered OTP: ${_pinTEController.text}");
    // print("Actual OTP: $widget.actualOtp");

    if (_formKey.currentState!.validate()) {
      setState(() => _pinVerifyInProgress = true);
    }
    NetworkResponse response = await NetworkCaller().getRequest(
      Urls.verifyOTP(widget.email, _pinTEController.text),
    );
    setState(() => _pinVerifyInProgress = false);

    if (response.isSuccess) {
      if (mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResetPasswordScreen(
                      email: widget.email,
                      otp: _pinTEController.text.toString(),
                    )));
        showSnackMessage(context, "Request success.");
      }
    } else {
      if (mounted) {
        showSnackMessage(context, "Request failed! Try again.", true);
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    //_pinTEController.dispose();
    super.dispose();
  }
}
