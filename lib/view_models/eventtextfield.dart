import 'package:flutter/material.dart';

class EventTextField extends StatelessWidget {
  final String name;
  final IconData icon;
  final TextEditingController controller;
  final int size;
  EventTextField(
      {required this.name,
        required this.icon, required this.controller,required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40,right: 30,top:15),
      child: TextFormField(
        maxLines: size,
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: name,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide:BorderSide(color: Colors.black)


          ),
        ),

      ),
    );
  }
}