// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _buildShowDialog(context);
      },
      leading: Checkbox(
        value: widget.todo.isCompleted,
        onChanged: (bool? checked) {
          context.read<TodoList>().toggleTodo(widget.todo.id);
        },
      ),
      title: Text(
        widget.todo.desc,
      ),
    );
  }

  Future<dynamic> _buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        bool error = false;
        textController.text = widget.todo.desc;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Edit Todo"),
              content: TextField(
                controller: textController,
                autofocus: true,
                decoration: InputDecoration(
                  errorText: error ? "Value connot be empty" : null,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("CANCEL"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      error = textController.text.isEmpty ? true : false;

                      if (!error) {
                        context.read<TodoList>().editTodo(
                              widget.todo.id,
                              textController.text,
                            );
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: const Text("EDIT"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
