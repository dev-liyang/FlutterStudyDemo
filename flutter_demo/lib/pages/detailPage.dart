import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  DetailPage(this.id, this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('详情界面'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: new Column(
                children: <Widget>[
                    new Row(
                    children: <Widget>[
                      new Expanded(
                        flex: 9,
                        child: new Text(
                          title, 
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1, 
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.red,
                          ), 
                        ),
                      ),
                      new Expanded(
                        flex: 2,
                        child: new Text(
                          'ID:' + id, 
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.red[500],
                          )
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new Text(
                content + title + id,
                style: TextStyle(
                  fontSize: 16.0
                )
              ),
          ],
        ),
      )
    );
  }
}
