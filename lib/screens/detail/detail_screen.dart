import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bus_app/components/sidebar/sidebar.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context)?.settings.arguments;
    final int id = obj["id"];

    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          )),
      drawer: Drawer(child: SideBar()),
      body: Container(
        child: Center(
            child: Text(
          '$id',
          style: TextStyle(
            fontSize: 28,
          ),
        )),
      ),
    );
  }
}
