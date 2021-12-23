import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {


  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = TextEditingController();
  String _enteredMessage = "";

  _sendMessage() async{
    FocusScope.of(context).unfocus();
    final user =  FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('userData').doc(user!.uid).get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdAt':Timestamp.now(),
      'fullName' : userData['FullName'],
      'userId' :user.uid ,
      'image' : userData['image'],
    });
    _controller.clear();
    setState(() {
      _enteredMessage = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(bottom: 35,left: 25,right: 15),
        child: Row(
        children: [
        Expanded(
        child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
        //cursorColor: Theme.of(context).primaryColor,
        autocorrect: true,
        enableSuggestions: true,
        textCapitalization: TextCapitalization.sentences,
        controller: _controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            color: Colors.black,
            disabledColor: Colors.black,
            icon: Icon(Icons.send),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,

          ),
          hintText: 'Send your message',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide:BorderSide(color: Colors.black)


          ),
        ),
        onChanged: (val){
          setState(() {
            _enteredMessage = val;
            print(_enteredMessage);
          });
        },
      ),
    ),

    ],
    ),
    );
  }
}