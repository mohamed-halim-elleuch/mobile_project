import 'package:flutter/material.dart';

class Gest_detector extends StatefulWidget {
  Function function;
  final String title;

  Gest_detector(this.title, this.function);

  @override
  _Gest_detectorState createState() => _Gest_detectorState();
}

class _Gest_detectorState extends State<Gest_detector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        widget.function();
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        width: 185,
        height: 80,
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.1,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.5),
            ],
          ),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
