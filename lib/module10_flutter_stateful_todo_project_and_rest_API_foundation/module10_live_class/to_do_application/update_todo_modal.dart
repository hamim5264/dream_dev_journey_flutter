import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_live_class/to_do_application/todo.dart';
import 'package:flutter/material.dart';

class UpdateTodoModal extends StatefulWidget {
  const UpdateTodoModal({
    super.key,
    required this.todo,
    required this.onTodoUpdate,
  });

  final Todo todo;
  final Function(String) onTodoUpdate;

  @override
  State<UpdateTodoModal> createState() => _UpdateTodoModalState();
}

class _UpdateTodoModalState extends State<UpdateTodoModal> {
  late TextEditingController _todoTEController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _todoTEController = TextEditingController(text: widget.todo.details);
  }

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
                  "Update todo",
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
                  return "Enter valid value";
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
                  widget.onTodoUpdate(_todoTEController.text.trim());
                  Navigator.pop(context);
                },
                child: const Text(
                  "Update",
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
