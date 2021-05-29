import 'package:flutter/material.dart';
//import 'package:flutter_app/adddetails.dart';
//import 'package:flutter_app/custom_model.dart';
//import 'package:flutter_app/custom_model.dart';

// ignore: must_be_immutable
class MyDetailPage extends StatefulWidget{
  final String name;
  final String phone;
  final String email;
  final String address;
  final String bankaccount;

  MyDetailPage(
      {this.name,
        this.phone,
        this.email,
        this.address,
        this.bankaccount}
      );
  @override
  State<StatefulWidget>createState(){
    return _MyDetailPageState();
  }
}
class _MyDetailPageState extends State<MyDetailPage> {


  // TODO: implement widget
  Widget get myProfile {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      decoration: BoxDecoration(
        // This would be a great opportunity to create a custom LinearGradient widget
        // that could be shared throughout the app but I'll leave that to you.
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              child: Text('${widget.name}',
              style: TextStyle(fontSize: 48.0),
            ),
            ),
            Container(
              child: Text('${widget.phone}',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            Container(
              child: Text('${widget.email}',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            Container(
              child: Text('${widget.address}',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Welcome, ${widget.name}'),
      ),
      body: myProfile,
    );
  }
}