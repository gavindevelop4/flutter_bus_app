import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(width: size.width, color: Colors.blue),
        ),
      ],
    );
  }
}
