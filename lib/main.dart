import 'package:flutter/material.dart';
import 'package:todo_app/keys_demo/keys.dart';
import 'package:todo_app/ui_updates_demo.dart';

void main() {
  runApp(const MyApp());
}
//todo: improve this app as my personal task management app and deploy it on firebase as a multilingual app(en, fr, port, es)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 200, 050, 020))
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sim\' Todo'),
        ),
        body: const Keys(),
      ),
    );
  }
}

