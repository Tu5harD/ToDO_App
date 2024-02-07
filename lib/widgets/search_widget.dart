import 'package:flutter/material.dart';
import 'package:todolist/constants/colors.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(minHeight: 20, maxWidth: 25),
            border: InputBorder.none,
            hintText: ' Search',
            hintStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
