import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/objectives/mission.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/function_class/googlesignin.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/Interfaces/choose.dart';
import 'package:flutter_application_1/Interfaces/signIn.dart';
import 'package:flutter_application_1/Interfaces/signUp_Admin.dart';
import 'package:flutter_application_1/Interfaces/signUp_member.dart';
import 'package:flutter_application_1/function_class/navigation%20bar.dart';
import 'package:provider/provider.dart';

import 'APImaps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List availablMission1 = DUMMY_MISSIONS;
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
          initialRoute: '/',
          routes: {
            //'/': (context) => const FirstInterface(),
            '/choose': (context) => const Choose(),
            '/signin': (context) => const SignIn(),
            '/signup_member': (context) => SignUpmember(),
            '/signup_admin': (context) => const SignUpAdmin(),
            '/navigation': (context) => Navigationbar(),
            '/logout': (context) => SignIn(),
            '/location': (context) =>  MapSample(),
          },
        ),
      );
}
