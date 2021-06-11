import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'setting',
        style: TextStyle(
          fontSize: 28,
        ),
      )),
    );
  }
}
