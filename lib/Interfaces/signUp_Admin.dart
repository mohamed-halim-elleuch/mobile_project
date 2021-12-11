import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/FirstInterface.dart';
import 'package:flutter_application_1/Interfaces/signIn.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
import 'package:flutter_application_1/function_class/buttons.dart';

class SignUpAdmin extends StatefulWidget {
  const SignUpAdmin({Key? key}) : super(key: key);

  @override
  _SignUpAdminState createState() => _SignUpAdminState();
}

class _SignUpAdminState extends State<SignUpAdmin> {
  late UserCredential userCredential;
  TextEditingController fullName = TextEditingController();
  TextEditingController ID= TextEditingController();
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
      await FirebaseFirestore.instance.collection('userAdmin').add({
        'FullName': fullName.text.trim(),
        'email': email.text.trim(),
        'ID': ID.text.trim(),
        'userid': userCredential.user?.uid,
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
    if (fullName.text.trim().isEmpty || fullName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Full Name !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));

      return;
    }
    if (ID.text.trim().isEmpty || ID.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your ID ! ',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));


      return;

    }
    if (ID.text.trim().length != 8 || ID.text.codeUnits == false) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter a valid ID',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));


      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter your Email !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("New Notification"),
      ));
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
    } else {
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
                      icon: Icons.supervised_user_circle_rounded, controller: fullName,),
                  MyTextField(
                      name: "ID", obscure: false, icon: Icons.credit_card, controller: ID,),
                  MyTextField(name: "Email", obscure: false, icon: Icons.email, controller: email,),
                  MyTextField(
                      name: "Password", obscure: true, icon: Icons.lock, controller: password,),
                  SizedBox(
                    height: 20,
                  ),
                  button(
                      val: "Register",
                      onTap: () {
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
