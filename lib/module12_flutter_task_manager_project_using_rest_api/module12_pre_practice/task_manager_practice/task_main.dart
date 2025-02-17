import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/screens/onboarding/email_verification_screen.dart';
import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/screens/onboarding/login_screen.dart';
import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/screens/onboarding/pin_verification_screen.dart';
import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/screens/onboarding/registration_screen.dart';
import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/screens/onboarding/set_password_screen.dart';
import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/screens/onboarding/splash_screen.dart';
import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/screens/tasks/new_task_list_screen.dart';
import 'package:dream_dev_journey_flutter/module12_flutter_task_manager_project_using_rest_api/module12_pre_practice/task_manager_practice/utility/task_utilities.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await readUserData("token");
  if(token == null){
    runApp(
      TaskManagerDemoApp("/login"),
    );
  }else{
    runApp(
      TaskManagerDemoApp("/newTaskList"),
    );
  }
}
class TaskManagerDemoApp extends StatelessWidget{
  final String firstRoute;
  const TaskManagerDemoApp(this.firstRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager Demo App",
      debugShowCheckedModeBanner: true,
      /// Named Routing
      initialRoute: firstRoute,
      routes: {
        "/" : (context) => SplashScreen(),
        "/login" : (context) => LoginScreen(),
        "/registration" : (context) => RegistrationScreen(),
        "/emailVerification" : (context) => EmailVerificationScreen(),
        "/pinVerification" : (context) => PinVerificationScreen(),
        "/setPassword" : (context) => SetPasswordScreen(),
        "/newTaskList" : (context) => NewTaskListScreen(),
      },
    );
  }
  
}
