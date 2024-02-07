import 'package:flutter/material.dart';
import 'package:todolist/constants/colors.dart';
import 'package:todolist/models/todo.dart';

class ToDoList extends StatelessWidget {
  const ToDoList(
      {super.key, required this.todo, this.onToDoChanged, this.onDeleteItems});
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItems;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        child: ListTile(
          onTap: () {
            onToDoChanged(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 3),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_circle : Icons.circle_outlined,
            size: 25,
            color: tdBlue,
          ),
          title: Text(
            '${todo.todoText!}',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: tdBlack,
                decoration: todo.isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: InkWell(
            onTap: () {
              onDeleteItems(todo.id);
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: tdRed,
              ),
              child: Center(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ));
  }
}
