import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_bus_app/screens/detail/detail_screen.dart';
import 'package:flutter_bus_app/screens/home/home_screen.dart';
import 'package:flutter_bus_app/screens/home/setting_screen.dart';
import 'package:flutter_bus_app/components/sidebar/sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.red,
          textTheme: TextTheme(bodyText1: TextStyle(fontSize: 14.0))),
      home: Scaffold(
        body: BottomNavigationController(),
      ),
      // initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // '/': (_) => HomeScreen(title: 'Bus App'),
        '/detail': (_) => DetailScreen(title: 'Bus Detail')
      },
    );
  }
}

class BottomNavigationController extends StatefulWidget {
  BottomNavigationController({Key? key}) : super(key: key);

  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值
  final pages = [HomeScreen(title: 'Bus App'), SettingScreen(title: 'Setting')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Bus App',
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
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cog), label: 'Setting'),
        ],
        currentIndex: _currentIndex, //目前選擇頁索引值
        onTap: _onItemClick, //BottomNavigationBar 按下處理事件
      ),
    );
  }

  //BottomNavigationBar 按下處理事件，更新設定當下索引值
  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
