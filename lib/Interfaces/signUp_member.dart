import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/signIn.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'dart:core';
class SignUpmember extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _SignUpmemberState createState() => _SignUpmemberState();
}
class _SignUpmemberState extends State<SignUpmember> {
  late UserCredential userCredential;
  TextEditingController fullName = TextEditingController();
  TextEditingController Repassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  bool loading = false;

  sendData() async {
    bool hasException = false;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      await FirebaseFirestore.instance.collection('userData').add({
        'userid': userCredential.user?.uid,
        'FullName': fullName.text.trim(),
        'email': email.text.trim(),
        'password': password.text.trim(),

      });
    } catch (e) {
      hasException = true;
      if (e is FirebaseException) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.grey[200],
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('weak password ! ',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold))
                    ],
                  )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.grey[200],
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('The account is already exist ! ',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold))
                ],
              )));
        }
      }
    } finally {
      if (!hasException) {
        setState(() {
          loading = false;
        });

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignIn()));
      } else {
        setState(() {
          loading = false;
        });
      }
    }
  }

  void validation() {

    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Email !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter a valid Email !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
    }

    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' Please Enter your Password !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));

      return;
    }
    if (password.text.trim() != Repassword.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' Please check your Password !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));

      return;
    }else {
      setState(() {
        loading = true;
      });
      sendData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/back1.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned(
                        //top: 35,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                  MyTextField(
                    name: "Full name",
                    obscure: false,
                    icon: Icons.supervised_user_circle_rounded,
                    controller: fullName,

                  ),

                  MyTextField(
                    name: "Email",
                    obscure: false,
                    icon: Icons.email,
                    controller: email,
                  ),
                  MyTextField(
                    name: "Password",
                    obscure: true,
                    icon: Icons.lock,
                    controller: password,
                  ),
                  MyTextField(
                    name: "Repeat Password",
                    obscure: true,
                    icon: Icons.lock,
                    controller: Repassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  loading
                      ? CircularProgressIndicator(color: Colors.black)
                      : button(
                          val: "register",
                          onTap: () async {
                            validation();
                          }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
