import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.userName,this.isMe);

  final String message;
  final String userName;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    Row(
    mainAxisAlignment: !isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: !isMe ? Colors.grey[300] : Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                bottomLeft: isMe ? Radius.circular(0) : Radius.circular(14),
                bottomRight: !isMe ? Radius.circular(0) : Radius.circular(14),
              )
          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Column(
              crossAxisAlignment:
              !isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userName + " :",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,

                    color: !isMe
                        ? Colors.blue
                        : Colors.white,
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: !isMe
                        ? Colors.black
                        : Colors.black
                  ),
                  textAlign: !isMe ? TextAlign.end : TextAlign.start,
                ),
              ],
            ),
          )
          ],
        ),

      ],
      overflow: Overflow.visible,
    );
  }
}