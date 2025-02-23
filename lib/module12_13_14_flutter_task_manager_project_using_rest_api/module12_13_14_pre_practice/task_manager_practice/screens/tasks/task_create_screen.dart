import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/api/api_clients.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  Map<String, String> formValues = {
    "title": "",
    "description": "",
    "status": "New",
  };
  bool isLoading = false;

  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues["title"]!.isEmpty) {
      taskAppErrorToast("Enter title");
    } else if (formValues["description"]!.isEmpty) {
      taskAppErrorToast("Enter description");
    } else {
      setState(() {
        isLoading = true;
      });
      bool res = await taskCreateRequest(formValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
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
      appBar: AppBar(
        title: Text(
          "Add New Task",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
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
                          "Add New Task",
                          style: head1Text(
                            colorDarkBlue,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: taskAppInputDecoration(
                            "Title",
                          ),
                          cursorColor: colorGreen,
                          onChanged: (textValue) {
                            inputOnChange("title", textValue);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          maxLines: 8,
                          textInputAction: TextInputAction.done,
                          decoration: taskAppInputDecoration(
                            "Description",
                          ),
                          cursorColor: colorGreen,
                          onChanged: (textValue) {
                            inputOnChange("description", textValue);
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
                            "Add",
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
