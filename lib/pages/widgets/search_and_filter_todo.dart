import 'package:flutter/material.dart';
import 'package:flutter_todo_provider/models/models.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class SearchAndFilterTodo extends StatelessWidget {
  const SearchAndFilterTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Search todos",
            labelStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search, color: Colors.black),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              context.read<TodoSearch>().setSearchTerm(newSearchTerm);
            }
          },
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.isCompleted),
          ],
        ),
      ],
    );
  }

  TextButton filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilter>().changeFilter(filter);
      },
      child: Text(
        filter == Filter.all
            ? "All"
            : filter == Filter.active
                ? "Active"
                : "Completed",
        style: TextStyle(
          fontSize: 18.0,
          color: textColor(context, filter),
        ),
      ),
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<TodoFilter>().state.filter;
    return currentFilter == filter ? Colors.black : Colors.black12;
  }
}
