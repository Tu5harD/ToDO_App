
import 'package:flutter/material.dart';
import 'package:todolist/screens/home.dart';

void main(){
  runApp(ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
