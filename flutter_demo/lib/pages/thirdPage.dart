import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  static const double IMAGE_ICON_WIDTH = 30.0;
  static const double ARROW_ICON_WIDTH = 16.0;
  
  var titles = ["banner","我的消息",  "我的博客", "我的问答", "我的活动", "我的团队", "邀请好友"];
  var images = [
    new Icon(Icons.message),
    new Icon(Icons.message),
    new Icon(Icons.format_align_justify),
    new Icon(Icons.question_answer),
    new Icon(Icons.access_time),
    new Icon(Icons.receipt),
    new Icon(Icons.face),
  ];

  var titleTextStyle = new TextStyle(fontSize: 17.0, color: Colors.black);
  
  Widget getIconImage(path) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
      child: new Image.asset(
        path,
        width: IMAGE_ICON_WIDTH, 
        height: IMAGE_ICON_WIDTH
      )
    );
  }

  Widget getHeadView(){
    Color color = Theme.of(context).primaryColor;
    return new Stack(
      alignment: Alignment(0.0, -0.5),
      children: <Widget>[
        new Container(
          height: 180.0,
          color: color,
        ),
        new Stack(
          alignment: Alignment(0.0, 1.8),
          children: <Widget>[
            new CircleAvatar(
              backgroundImage: new AssetImage('images/avatar.jpeg'),
              radius: 50.0,
            ),
            new Container(
              child: new Text(
                'Flutter_Coder',
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  //渲染row
  Widget _buildRow (int index){
    //头视图
    if(index == 0){
      return getHeadView();
    }
    
    //row
    String title = titles[index];
    return new Card(
      child: new ListTile(          
          leading: images[index],
          title: new Container(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 10.0),
            child: Text(title),
          ),
          trailing: new Icon(Icons.arrow_right),
        ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
      body: new ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index){
          return _buildRow(index);
        },
      )
    );
  }
}