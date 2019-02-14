import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:front/config.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State {
  TextEditingController _userName = TextEditingController();
  TextEditingController _passWord = TextEditingController();

  void onClickLogin() {
    Map<String, String> params = Map();
    params['userName'] = _userName.text;
    params['passWord'] = _passWord.text;
    http.post('${Config.API_URL}/user/login', body: params).then((response) {
      Map retMap = jsonDecode(response.body);
      int status = retMap['status'];
      if (status == 0) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงชื่อเข้าใช้'),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        children: <Widget>[
          TextField(
            controller: this._userName,
            decoration: InputDecoration(hintText: 'ชื่อผู้ใช้'),
          ),
          TextField(
            controller: this._passWord,
            decoration: InputDecoration(hintText: 'รหัสผ่าน'),
          ),
          FlatButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => RegistorScreen())),
            child: Text(
              'ลงทะเบียน',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: onClickLogin,
              child: Text('ตกลง'),
            ),
          )
        ],
      ),
    );
  }
}

class RegistorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistorScreen();
  }
}

class _RegistorScreen extends State {
  TextEditingController _userName = TextEditingController();
  TextEditingController _passWord = TextEditingController();
  TextEditingController _passWord2 = TextEditingController();

  void onClickRegistor() {
    Map<String, String> params = Map();
    params['userName'] = _userName.text;
    params['passWord'] = _passWord.text;
    http.post('${Config.API_URL}/user/registor', body: params).then((response) {
      Map retMap = jsonDecode(response.body);
      int status = retMap['status'];
      if (status == 0) {
        return Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงทะเบียน'),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        children: <Widget>[
          TextField(
            controller: _userName,
            decoration: InputDecoration(hintText: ': ชื่อผู้้ใช้'),
          ),
          TextField(
            controller: _passWord,
            decoration: InputDecoration(hintText: ': รหัสผ่าน'),
          ),
          TextField(
            controller: _passWord2,
            decoration: InputDecoration(hintText: ': รหัสผ่านอีกครั้ง'),
          ),
          Center(
            child: RaisedButton(
              onPressed: onClickRegistor,
              child: Text('ตกลง'),
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hello'),
    );
  }
}
