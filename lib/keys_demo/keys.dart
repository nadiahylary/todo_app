import 'package:flutter/material.dart';
import 'package:todo_app/keys_demo/checkable_todo_item.dart';
import 'package:todo_app/keys_demo/todo_item.dart';

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({Key? key}) : super(key: key);

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> {

  var _order = 'asc';

  final _todos = [
    const Todo(
      'Code in Flutter',
      Priority.urgent,
    ),
    const Todo(
      'Practice Flutter',
      Priority.normal,
    ),
    const Todo(
      'Explore other courses',
      Priority.low,
    ),
    const Todo(
      'Learn Flutter',
      Priority.urgent,
    ),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              // for (final todo in _orderedTodos) TodoItem(todo.text, todo.priority),
              for (final todo in _orderedTodos)
                /*CheckableTodoItem(
                  todo.text,
                  todo.priority,
                  key: ObjectKey(todo),
                  //key: ValueKey(todo.text),
                ),*/
                Row(
                  key: ObjectKey(todo.text), //without this the state of the row is not kept track of
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    CheckableTodoItem(
                      todo.text,
                      todo.priority,
                      key: ValueKey(todo.text),
                    ),
                   /* TodoItem(
                      todo.text,
                      todo.priority,
                      key: ValueKey(todo.text),
                    ),*/
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
