import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_assignment/task_app/task.dart';
import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_assignment/task_app/task_card.dart';
import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_assignment/task_app/task_input_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const TaskApp(),
  );
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskAppHomeScreen(),
      title: "Task App",
      debugShowCheckedModeBanner: false,
    );
  }
}

class TaskAppHomeScreen extends StatefulWidget {
  const TaskAppHomeScreen({super.key});

  @override
  State<TaskAppHomeScreen> createState() => _TaskAppHomeScreenState();
}

class _TaskAppHomeScreenState extends State<TaskAppHomeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Task> taskList = [];

  void addTask() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        taskList.add(Task(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
        ));
        _titleController.clear();
        _descriptionController.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  void editTask(int index) {
    _titleController.text = taskList[index].title;
    _descriptionController.text = taskList[index].description;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TaskInputField(
                  controller: _titleController, hintText: "Edit Title"),
              const SizedBox(height: 16),
              TaskInputField(
                  controller: _descriptionController,
                  hintText: "Edit Description"),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    taskList[index] = Task(
                      title: _titleController.text.trim(),
                      description: _descriptionController.text.trim(),
                    );
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  "Edit Done",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.search,
            color: Colors.blue,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TaskInputField(
                      controller: _titleController, hintText: "Add Title"),
                  const SizedBox(height: 16),
                  TaskInputField(
                      controller: _descriptionController,
                      hintText: "Add Description"),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: addTask,
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    task: taskList[index],
                    onEdit: () => editTask(index),
                    onDelete: () => deleteTask(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
