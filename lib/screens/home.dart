import 'package:flutter/material.dart';
import 'package:todolist/constants/colors.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/widgets/search_widget.dart';
import 'package:todolist/widgets/todo_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final String title = "TODO";
  final todolist = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todolist;
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: tdBlack,
                          size: 20,
                        ),
                        prefixIconConstraints:
                            BoxConstraints(minHeight: 20, maxWidth: 25),
                        border: InputBorder.none,
                        hintText: ' Search',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400)),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 20),
                        child: Text(
                          "All ToDos",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoList(
                          onToDoChanged: _handleToDoChnage,
                          onDeleteItems: _deleteToDoItem,
                          todo: todo,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(20),
                  //   boxShadow: [
                  //     BoxShadow(
                  //         color: Colors.lightBlue,
                  //         offset: Offset(0.0, 0.0),
                  //         blurRadius: 0.5,
                  //         spreadRadius: 0)
                  //   ],
                  // ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: InkWell(
                    onTap: () {
                      _addToDoItems(_todoController.text);
                    },
                    child: Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: tdBlue,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChnage(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItems(String todo) {
    setState(() {
      todolist
          .add(ToDo(id: DateTime.now().millisecond.toString(), todoText: todo));
    });
    _todoController.clear();
  }

  void _runFilter(String enterKeyword) {
    List<ToDo> result = [];
    if (enterKeyword.isEmpty) {
      result = todolist;
    } else {
      result = todolist
          .where((item) =>
              item.todoText!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = result;
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 5,
      title: Padding(
        padding: EdgeInsets.all(10.0), // Adjust the value as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            Text(
              '${title}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            Center(
              child: Container(
                height: 40,
                width: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    "assets/images/avtar.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: tdBGColor,
    );
  }
}
