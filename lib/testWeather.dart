import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class buildRow extends StatelessWidget {
  final String title;

  String iconweather;

  int max;

  int min;

  buildRow(this.title, this.iconweather, this.max, this.min);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Padding(padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0)),
      Container(
        child: Text(title,
            textAlign: TextAlign.start, style: TextStyle(fontSize: 19)),
        width: 110,
      ),
      SizedBox(


        width: MediaQuery.of(context).size.width / 4,

      ),
      Image.network(
        iconweather,
        scale: 1.1,
      ),
      SizedBox(
        width: 50,
      ),
      Text('$max°/$min°',
          textAlign: TextAlign.start, style: TextStyle(fontSize: 16))
    ]);
  }
}

class Card2 extends StatelessWidget {
  var resultDays;
  Function getWeather;
  Card2(this.resultDays, this.getWeather());

  @override
  Widget build(BuildContext context) {
    buildCollapsed3() {
      return Container();
    }

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildRow(
                    "${resultDays['1']['day']}",
                    'http://openweathermap.org/img/w/${resultDays['1']["icon"]}.png',
                    resultDays['1']['temp_max'],
                    resultDays['1']['temp_min']),
                buildRow(
                    '${resultDays['2']['day']}',
                    'http://openweathermap.org/img/w/${resultDays['2']["icon"]}.png',
                    resultDays['2']['temp_max'],
                    resultDays['2']['temp_min']),
                buildRow(
                    "${resultDays['3']['day']}",
                    'http://openweathermap.org/img/w/${resultDays['3']["icon"]}.png',
                    resultDays['3']['temp_max'],
                    resultDays['3']['temp_min']),
                buildRow(
                    "${resultDays['4']['day']}",
                    'http://openweathermap.org/img/w/${resultDays['4']["icon"]}.png',
                    resultDays['4']['temp_max'],
                    resultDays['4']['temp_min']),
                if (resultDays['5'] != null)
                  buildRow(
                      "${resultDays['5']['day']}",
                      'http://openweathermap.org/img/w/${resultDays['5']["icon"]}.png',
                      resultDays['5']['temp_max'],
                      resultDays['5']['temp_min']),
              ],
            ),
          ),
        ),
      );
    }

    return ExpandableNotifier(
        child: ScrollOnExpand(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expandable(
              collapsed: buildCollapsed3(),
              expanded: buildExpanded3(),
            ),
            Divider(
              color: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    var controller =
                        ExpandableController.of(context, required: true);
                    return TextButton(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                        child: Text(
                          controller!.expanded ? "COLLAPSE" : "EXPAND",
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: Colors.deepPurple,
                                fontSize: 16,
                              ),
                        ),
                      ),
                      onPressed: () {
                        controller.toggle();
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
