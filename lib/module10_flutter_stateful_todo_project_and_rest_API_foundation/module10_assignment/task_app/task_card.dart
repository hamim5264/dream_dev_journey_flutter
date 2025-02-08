import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_assignment/task_app/task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskCard(
      {super.key,
      required this.task,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        subtitle: Text(task.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                onPressed: onEdit),
            IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.blue,
                ),
                onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
