import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;
    
    Widget titleSection = new Container(
      color: Colors.yellow[200],
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: color,
            size: 28.0,
          ),
          new Text('41'),
        ],
      ),
    );
    
    Widget buildButtonColumn (IconData icon, String label){
      Color color = Theme.of(context).primaryColor;
      return Container(
        // margin: const EdgeInsets.only(left: 15.0),
        child: new Column(
          children: <Widget>[
            new Icon(icon, color: color),
            new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(
                label,                
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                )
              )
            )
          ]
        ),
      );
    }

    Widget buttonSection = new Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.lightGreen[200],
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildButtonColumn(Icons.home, 'HOME'),
          buildButtonColumn(Icons.message, 'MESSAGE'),
          buildButtonColumn(Icons.settings, 'SETTINGS'),
          buildButtonColumn(Icons.search, 'SEARCH'),
        ],
      ),
    );

    Widget textSection = new Container(
      color: Colors.lightBlue[200],
      padding: const EdgeInsets.all(20.0),
      // margin: const EdgeInsets.all(20.0),
      child: new Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: new TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
      ),
    );

    Widget bannerSection = new Container(
      child: new Stack(
        children: <Widget>[
          new Positioned(
            child: new Image.asset(
              'images/lake.jpg',
              width: 375.0,
              height: 180.0,
              fit: BoxFit.fill,
            ),
          ),
          new Positioned(
            child: new Container(
              padding: new EdgeInsets.all(16.0),
              child: new Text(
                "Lorem ipsum",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0),
              ),
              color: Color.fromRGBO(255, 255, 255, 0.6),
            ),
            width: 375.0,
            left: 0.0,
            bottom: 10.0,
          )
        ]
      )
    );

    void _showMessage(String name) {
      showDialog<Null>(
        context: context,
        builder: (context){
          return new AlertDialog(
            title: new Text('title'),
            content: new Text(name),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text('确定')
              )
            ]
          );
        },
      );
    }

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('首页'),
        ),
        body: new ListView(
          children: [
            // Image.asset(
            //   'images/lake.jpg',
            //   width: 300.0,
            //   height: 170.0,
            //   fit: BoxFit.cover,
            // ),
            bannerSection,
            titleSection,
            buttonSection,
            textSection,
            new RaisedButton(
              padding: EdgeInsets.all(20.0),
              color: color,
              child: new Text('弹出提示框', style: new TextStyle(color: Colors.black),),
              onPressed: ()=> _showMessage('hahaha'),
            ),
            new IconButton(
              tooltip: '展示alert',
              icon: new Icon(Icons.add), 
              onPressed: ()=> _showMessage('hahaha'),
            )
          ],
        ),
      );
  }
}
