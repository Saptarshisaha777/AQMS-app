import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDataPage(),
    );
  }
}
class MyDataPage extends StatefulWidget {
  @override
  _MyDataPageState createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage>{
int value1= 601;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color getColor(){
      if(value1<600)
        return Colors.green;
      else if(value1>700)
        return Colors.redAccent;
      else
        return Colors.amberAccent;
    }
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
      IconButton(
      icon: const Icon(Icons.navigate_before),
        tooltip: 'Back to home page',
        onPressed: () {
        },
      )
        ],
        title: Text('Data Extraction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Container(
              child: Text('Value: ${value1}',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28,backgroundColor: getColor()),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
