import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'package:flutter_application_1/function_class/gest_detector_language.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Container(
      height: 820,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(249, 249, 249, 1),
            Color.fromRGBO(186, 186, 186, 1),
            Color.fromRGBO(255, 207, 207, 1),
            Color.fromRGBO(107, 107, 107, 1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
        child:  Column(
          children: [
            SizedBox(height: 40,),
            Row(
              children: [
                SizedBox(width: 50,),
                Icon(Icons.language,size: 70,color: Colors.grey[800],),
                SizedBox(width: 70,),
                Container(
                    child: Text("Language ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.grey[600]),)),
              ],
            ),
            GestDetLan("English",(){},'assets/eng.png'),
            GestDetLan("French ",(){},'assets/fr.png'),
            GestDetLan("Arabic ",(){},'assets/tn.png'),
            SizedBox(height: 50,),

            button(val: "Change",onTap: (){} )
          ],
        ),
    )
    )
    );
  }
}
