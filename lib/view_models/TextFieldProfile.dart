import 'package:flutter/material.dart';

class MyTextFieldProfile extends StatelessWidget {
  final String name;
  final Color color;
  final double width;


  final TextEditingController controller;
  MyTextFieldProfile(
      { required this.name,required this.color,required this.width,required this.controller,});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40,right: 30,top:25),
      width:width,
        child: Column(
        children: [

          TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(

              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.orange),
              ),
              hintText: name,
              hintStyle: TextStyle(color: color),
              ),
            ),

        ],
      ),

    );
  }
}