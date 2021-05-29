import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/extraction2.dart';
import 'package:flutter_app/graphdetails.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget>createState(){
    return _MyAppState();
  }
}
// This widget is the root of your application.
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyButton(),
    );
  }
}

class MyButton extends StatefulWidget {



  @override
  _MyButtonState createState() => _MyButtonState();

  final String title;
  MyButton({
    @required this.title,
});


}

class _MyButtonState extends State<MyButton> {
  var $title;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("Graph")
      ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children:<Widget>[

            ElevatedButton(

                      child :Text('CO2', style: TextStyle(color: Colors.redAccent),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState>states) {
                                if
                                (states.contains((MaterialState.pressed)))
                                  return Colors.blueGrey;
                                return Colors.white;
                              })
                      ),
                      onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GraphPage(title: 'CO2',)),
                    );
                  }),
            ElevatedButton(
                child :Text('No2', style: TextStyle(color: Colors.redAccent),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState>states) {
                          if
                          (states.contains((MaterialState.pressed)))
                            return Colors.blueGrey;
                          return Colors.white;
                        })
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GraphPage(title: 'NO2' )),
                  );

                }),

           ElevatedButton(
                child :Text('CO', style: TextStyle(color: Colors.redAccent),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState>states) {
                            if
                            (states.contains((MaterialState.pressed)))
                            return Colors.blueGrey;
                            return Colors.white;
                          })
                ),

                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GraphPage(title: 'CO',)),
                  );

                }),
            ElevatedButton(
                child :Text('Temperature', style: TextStyle(color: Colors.redAccent),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState>states) {
                          if
                          (states.contains((MaterialState.pressed)))
                            return Colors.blueGrey;
                          return Colors.white;
                        })
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GraphPage(title: 'Temperature',)),
                  );

                }),
               ElevatedButton(
                child :Text('Humidity', style: TextStyle(color: Colors.redAccent),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState>states) {
                          if
                          (states.contains((MaterialState.pressed)))
                            return Colors.blueGrey;
                          return Colors.white;
                        })
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GraphPage(title: 'Humidity',)),
                  );

                }),

    ]
          ),



        );


  }
}
