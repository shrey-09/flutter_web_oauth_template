import 'package:flutter/material.dart';
class AfterLogin extends StatefulWidget {
  String data;
  AfterLogin(String data){
    this.data=data;
  }

  @override
  _AfterLoginState createState() => _AfterLoginState(data);
}

class _AfterLoginState extends State<AfterLogin> {
  @override
  String data;
  _AfterLoginState(String data){
    this.data=data;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // You need to change the length of string you want to display, as the domain name changes
          child: Text(data),
        ),
      ),
    );
  }
}
