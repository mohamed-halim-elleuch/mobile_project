import 'package:flutter/material.dart';

class TextFieldMission extends StatelessWidget {
  final String name;
  final double size;
  final int line;
  final TextEditingController controller;
  TextFieldMission(
      { required this.name,
         required this.size,
        required this.line,
        required this.controller,
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: TextFormField(
        controller: controller,
        maxLines: line,
        textAlign: TextAlign.center,

        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: name,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
          ),
        ),

      ),
    );
  }
}

