import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import './detailPage.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var _dataArray = [];

  _getListData() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var httpClient = new HttpClient();
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(Utf8Decoder()).join();
        var data = jsonDecode(json);
        result = data;
      } else {
        result = [];
      }
    } catch (exception) {
      result = [];
    }

    if (!mounted) return;

    setState(() {
      _dataArray = result;
    });
  }
  
  @override
  void initState() {
    super.initState();
    _getListData();
  }

  @override 
  Widget build(BuildContext context){

    //导航到详情界面
    void _pushDetail(String id, String title, String content){
      Navigator.push(context, new MaterialPageRoute(
        builder: (context){
          return new DetailPage(id, title, content);
        }
      ));
    }

    //渲染row
    Widget _buildRow (int index){

      Map data = _dataArray[index];
      String title = data['title'];
      String content = data['body'];
      int id = data['id'];
      return new Card(
        child: new ListTile(
            onTap: ()=>_pushDetail('$id', title, content),
            title: new Container(
              padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('ID:$id'),
                  new Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            trailing: new Icon(Icons.arrow_right),
          ),
      );
    }

    Widget _getBody(){
      if (_dataArray == null || _dataArray.length == 0) {
        return new Center(
          child: new CircularProgressIndicator(),
        );
      }
      else {
        return ListView.builder(
          itemCount: _dataArray.length,
          itemBuilder: (context, index){
            return _buildRow(index);
          },
        );
      }
    }

    return Scaffold(
      appBar: new AppBar(
        title: new Text('消息3'),
      ),
      body: _getBody(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            _dataArray = null;
          });
          _getListData();
        },
        child: new Icon(Icons.replay),
      ),
    );
  }
}


