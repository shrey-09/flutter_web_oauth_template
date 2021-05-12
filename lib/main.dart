import 'package:flutter/material.dart' ;
import "package:universal_html/html.dart" as html;
import 'afterlogin.dart';

html.WindowBase _popupWin;
void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  linkShink(){
    final authUrl =
        'https://accounts.spotify.com/authorize?client_id=0b71d241b89444cebcf5dac05f3ba343&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A40000%2Fstatic.html';
    _popupWin = html.window.open(authUrl, "Spotify Auth", "width = 500, height = 800, scrollbars = yes");
    html.window.onMessage.listen((event) {
      /// If the event contains the token it means the user is authenticated.
      if (event.data.toString().contains('?code=')) {
        _login(event.data);
      }
    });
  }


  void _login(String data) {
    final receivedUri = Uri.parse(data);
    if (_popupWin != null) {
      _popupWin.close();
      _openMyPage(data);
    }
  }

  void _openMyPage(String data) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AfterLogin(data)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: TextButton(
            child: Text("Login To Spotify",style: TextStyle(color: Colors.black),),
            onPressed: linkShink,//Thread1,
          ),
        ),
      ),
    );
  }
}

