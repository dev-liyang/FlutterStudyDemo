import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './pages/firstPage.dart';
import './pages/secondPage.dart';
import './pages/thirdPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
      ),
      home: new MyAppDemo(),
    );
  }
}

class MyAppDemo extends StatefulWidget {
  @override
  _MyAppDemoState createState() => _MyAppDemoState();
}

class _MyAppDemoState extends State<MyAppDemo> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }
  
  @override
  void dispose (){
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage()
        ],
      ),
      bottomNavigationBar: new TabBar(
        controller: controller,
        indicatorColor: Colors.white,
        labelColor: color,
        tabs: <Widget>[
          new Tab(text: '首页', icon: new Icon(Icons.home)),
          new Tab(text: '消息', icon: new Icon(Icons.message)),
          new Tab(text: '我的', icon: new Icon(Icons.info)),
        ],
      ),
    );  
  }
}