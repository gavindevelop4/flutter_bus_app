import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bus_app/screens/home/components/color_block.dart';

// data
import '/api/entry.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;

  List data = [];

  void getData() {
    List responseList = ENTRY_DATA;
    setState(() {
      data = responseList;
    });
  }

  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.topCenter,
            height: closeTopContainer ? 0 : 80,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: TextField(
                decoration: InputDecoration(
                    icon: FaIcon(FontAwesomeIcons.search),
                    border: InputBorder.none),
              ),
            ),
            // ),
          ),
          Flexible(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: ListView.builder(
                controller: controller,
                padding: const EdgeInsets.only(top: 20),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    child: ColorBlock(
                        title: data[index]['route'],
                        index: data[index]['id'],
                        timeUntil: data[index]['timeUntil'],
                        destination: data[index]['destination']),
                  );
                }),
          ))
        ]));
  }
}
