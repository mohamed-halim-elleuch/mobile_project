import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'package:flutter_application_1/function_class/navigation%20bar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();

}

class _SignInState extends State<SignIn> {
  bool loading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future loginUser() async {
    bool hasException = false;

    try {


      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // ignore: nullable_type_in_catch_clause
    } on FirebaseException catch (e) {
      hasException = true;

      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            backgroundColor: Colors.grey[200],
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No User Found !!',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
              ],
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            backgroundColor: Colors.grey[200],
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wrong Password !! ',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
              ],
            )));

      }



    }
    finally {
      if (!hasException) {
        setState(() {
          loading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Navigationbar()));
      } else {
        setState(() {
          loading = false;
        });
      }
    }
  }

  void validation() {
    if ((email.text.trim().isEmpty || email.text.trim() == null) &&
        (password.text.trim().isEmpty || password.text.trim() == null)) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('All Fields are Empty !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
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
    }   else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text)
    ) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
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
    else if (password.text.trim().isEmpty || password.text.trim() == null) {
      // ignore: deprecated_member_use
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Passowrd !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    } else {
      setState(() {
        loading = true;
      });
      loginUser();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/back2.png',
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
                MyTextField(name: "Email", obscure: false, icon: Icons.email, controller: email,),
                MyTextField(name: "Password", obscure: true, icon: Icons.lock, controller: password,),
                SizedBox(
                  height: 20,
                ),
                button(
                    val: "Sign In",
                    onTap: () {
                      validation();
                    }),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ])));
  }
}
