import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Testsouvenir extends StatefulWidget {
  final String title;
  final String date;
  final String image;
  Testsouvenir({ required this.title,required this.date,required this.image}) ;



  @override
  _TestsouvenirState createState() => _TestsouvenirState();
}

class _TestsouvenirState extends State<Testsouvenir> {
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      color: Colors.white70,
      child: Column(
        children: [
          ListTile(
            //leading: Icon(Icons.arrow_drop_down_circle),
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 18, color: Colors.blueAccent),
            ),
            subtitle: Text(
              'On ${widget.date}',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Card4(img: widget.image)
        ],
      ),
    );
  }
}

class Card4 extends StatefulWidget {
  final String img;
  Card4({required this.img});
  @override
  _Card4State createState() => _Card4State();
}

class _Card4State extends State<Card4> {
  @override
  Widget build(BuildContext context) {
    buildCollapsed3() {
      return Container(
        child: Image.network(widget.img),
      );
    }

    buildExpanded3() {
      return  Container();
    }

    return ExpandableNotifier(
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            //elevation: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed3(),
                  expanded: buildExpanded3(),
                ),
                Builder(
                  builder: (context) {
                    var controller =
                    ExpandableController.of(context, required: true)!;
                    return AppBar(
                        backgroundColor: Colors.white,
                        //toolbarHeight: 50,
                        automaticallyImplyLeading: false,


                          leading:LikeButton(
                            size: 25,
                            circleColor:
                            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.favorite,
                                color: isLiked ? Colors.red : Colors.grey,
                                size: 25,
                              );
                            },
                            likeCount: 0,
                          ),

                        actions: [
                          IconButton(
                            icon: Icon(
                              controller.expanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: Colors.blue,
                              size: 25,
                            ),
                            onPressed: () {
                              controller.toggle();
                            },
                          ),
                        ]);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
