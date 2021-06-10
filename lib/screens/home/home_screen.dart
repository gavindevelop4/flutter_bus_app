import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(title),
            elevation: 0,
            leading: IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: () {},
            )),
        body: Center(
          child: ListView.builder(
              // padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(
                      child: ColorBlock(title: 'Entry ${entries[index]}')),
                );
              }),
        ));
  }
}

class ColorBlock extends StatelessWidget {
  const ColorBlock({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[Text(title), Text('mins')],
            )));
  }
}
