import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_live_class/to_do_application/todo.dart';
import 'package:flutter/material.dart';

class AddNewTaskModal extends StatefulWidget {
  const AddNewTaskModal({
    super.key,
    required this.onAddTap,
  });

  final Function(Todo) onAddTap;

  @override
  State<AddNewTaskModal> createState() => _AddNewTaskModalState();
}

class _AddNewTaskModalState extends State<AddNewTaskModal> {
  final TextEditingController _todoTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add new todo",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: _todoTEController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Enter your todo here",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return "Enter a value";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Todo todo = Todo(
                      details: _todoTEController.text.trim(),
                      createdDateTime: DateTime.now(),
                      updatedDateTime: DateTime.now(),
                    );
                    widget.onAddTap(todo);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
