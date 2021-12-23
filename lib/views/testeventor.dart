import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Testeventor extends StatefulWidget {
  final String title;
  final String date;
  final String image;
  final String description;
  Testeventor({Key? key, required this.title,required this.date,required this.image,required this.description}) : super(key: key);



  @override
  _TesteventorState createState() => _TesteventorState();
}

class _TesteventorState extends State<Testeventor> {
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      color: Colors.white70,
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 18, color: Colors.blueAccent),
            ),
            subtitle: Text(
              'On ${widget.date}',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Card3(img: widget.image,des: widget.description)
        ],
      ),
    );
  }
}

class Card3 extends StatefulWidget {
  final String img;
  final String des;
  Card3({required this.img,required this.des});
  @override
  _Card3State createState() => _Card3State();
}

class _Card3State extends State<Card3> {
  @override
  Widget build(BuildContext context) {
    buildCollapsed3() {
      return Container(
        child: Image.network(widget.img),
      );
    }

    buildExpanded3() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(widget.img),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
              child: Text(widget.des,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      );
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
                    automaticallyImplyLeading: false,
                    title: LikeButton(
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
                    leading:
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
                    );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
