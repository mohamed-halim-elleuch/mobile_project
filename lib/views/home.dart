import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'FirstInterface.dart';
import '../view_models/buttons.dart';
import '../view_models/navigation bar.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, sncpshot) {
            if (sncpshot.connectionState == ConnectionState.waiting)
              return Center(child:CircularProgressIndicator());
            else if (sncpshot.hasData) {
              return AnimatedSplashScreen(
                duration: 3000,
                splashIconSize: 200,
                splash: Image.asset('assets/logo.png',),
                nextScreen: Navigationbar(),
                splashTransition: SplashTransition.scaleTransition,
              );
            }
            else if (sncpshot.hasError) {
              return Center(
                child: Text('Something Went Wrong !'),
              );
            }
            else return AnimatedSplashScreen(
                duration: 3000,
                splashIconSize: 200,
                splash: Image.asset('assets/logo.png',),
                nextScreen: FirstInterface(),
                splashTransition: SplashTransition.scaleTransition,
              );
          }
      ),
    );
  }
}
