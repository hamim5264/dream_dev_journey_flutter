import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_live_class/to_do_application/add_new_todo_modal.dart';
import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_live_class/to_do_application/todo.dart';
import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_live_class/to_do_application/update_todo_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyToDoAppHomeScreen extends StatefulWidget {
  const MyToDoAppHomeScreen({super.key});

  @override
  State<MyToDoAppHomeScreen> createState() => _MyToDoAppHomeScreenState();
}

class _MyToDoAppHomeScreenState extends State<MyToDoAppHomeScreen> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        onPressed: () {
          showModalBottomSheet(
            isDismissible: false,
            context: context,
            builder: (context) {
              return AddNewTaskModal(
                onAddTap: (Todo task) {
                  addTodo(task);
                },
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.separated(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final Todo todo = todoList[index];
          final String formattedDate =
              DateFormat("hh:mm a dd-MM-yyyy").format(todo.createdDateTime);

          return ListTile(
            tileColor: todo.status == "Done" ? Colors.grey : null,
            onLongPress: () {
              String currentStatus =
                  todo.status == "Pending" ? "Done" : "Pending";
              updateTodoStatus(index, currentStatus);
            },
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      "Actions",
                    ),
                    content: SizedBox(
                      height: 180,
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                            title: const Text(
                              "Update",
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return UpdateTodoModal(
                                      todo: todo,
                                      onTodoUpdate:
                                          (String updatedDetailsText) {
                                        updateTodo(index, updatedDetailsText);
                                      },
                                    );
                                  });
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.delete_rounded,
                              color: Colors.red,
                            ),
                            title: const Text(
                              "Delete",
                            ),
                            onTap: () {
                              deleteTodo(index);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.cancel,
                              color: Colors.blue,
                            ),
                            title: const Text(
                              "Cancel",
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                "${index + 1}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(todo.details),
            subtitle: Text(formattedDate),
            trailing: Text(todo.status.toUpperCase()),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 4,
          );
        },
      ),
    );
  }

  void addTodo(Todo todo) {
    todoList.add(todo);
    setState(() {});
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
    setState(() {});
  }

  void updateTodo(int index, String todoDetails) {
    todoList[index].details = todoDetails;
    setState(() {});
  }

  void updateTodoStatus(int index, String status) {
    todoList[index].status = status;
    setState(() {});
  }
}
