import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "TODO",
          style: TextStyle(
            fontSize: 40.0,
          ),
        ),
        Text(
          "${context.watch<ActiveTodoCount>().state.activeTodoCount} items left",
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
