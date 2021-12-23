import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestDetLan extends StatefulWidget {
  Function function;
  final String title;
  final String image;
  GestDetLan (this.title, this.function,this.image);
  @override
  _GestDetLanState createState() => _GestDetLanState();
}

class _GestDetLanState extends State<GestDetLan> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        widget.function();
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        width: 350,
        height: 130,
        child:

        Row(
          children: [
            SizedBox(width: 50,),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(width: 50,),
            Image.asset(widget.image),
          ],
        ),

      ),
    );
  }
}

