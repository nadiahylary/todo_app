import 'package:flutter/material.dart';
import 'package:todo_app/ui_updates_demo.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Internals'),
      ),
      body: const UIUpdatesDemo(),
    ),
  ));
}
