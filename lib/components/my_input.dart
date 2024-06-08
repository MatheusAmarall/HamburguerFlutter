import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {

  String placeholder;
  bool type;
  TextEditingController controller;

  MyInput({Key? key, required this.placeholder, required this.type, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8
      ),
        child: TextField(
          controller: controller,
          obscureText: type,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: placeholder
          )
        )
      );
  }
}
