import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static const String _title = 'Ranges';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyRanges(),
    );
  }
}

class MyRanges extends StatefulWidget {
  @override
  _MyRangesState createState() => _MyRangesState();
}

class _MyRangesState extends State<MyRanges>{

   double _co2lower=1.0;
   double _co2upper=500.0;



   var co2values3= RangeValues(1000, 9999);
   var co2values1= RangeValues(600, 1000);
   var co2values2= RangeValues(350, 600);
   // ignore: non_constant_identifier_names
   var NOxValues3=RangeValues(1600, 9999);
   var NOxValues1=RangeValues(1200, 1600);
   var NOxValues2=RangeValues(0, 1200);

   var covalues3=RangeValues(1600, 9999);
   var covalues1=RangeValues(1200, 1600);
   var covalues2=RangeValues(0, 1200);

   var temp=RangeValues( 35, 100);
   var goodtemp=RangeValues(0, 35);

   var humidity= RangeValues(80, 100);
   var goodhumidvalues= RangeValues(0, 80);
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
        title: Text("Air Pollution Measuring & Detection App",
        textAlign: TextAlign.center,
    ),
    ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children:[
            Text('AQI Ranges ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text('(Gas & Weather Parameters)', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
    ]
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),

             // Optional
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("NO2"
              ''
                  """
(mV)""", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
               Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Poor", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text('Above ${NOxValues3.start.round()} ', style: TextStyle(color: Colors.red, fontSize: 16.0),),
                ],
               ),
               ),
              Expanded(child:
              Column(
                children: <Widget>[
                  Text('Moderate', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text('${NOxValues1.start.round()} --- ${NOxValues1.end.round()}', style: TextStyle(color: Colors.blueAccent, fontSize: 16.0), ),

                ],

              )),
              Expanded(child: Column(
                children: <Widget>[
                  Text("Good",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text('${NOxValues2.start.round()} --- ${NOxValues2.end.round()}', style: TextStyle(fontSize: 16.0),),

                ],
              )
              ),
                 ],
              ),
              ),
        new Container(
          padding: EdgeInsets.all(20),

          // Optional
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("""CO2""" ''
              """(ppm)""", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Poor", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text(' Above ${co2values3.start.round()}', style: TextStyle(color: Colors.red, fontSize: 16.0),),

                ],
              ),
              ),
              Expanded(child:
              Column(
                children: <Widget>[
                  Text('Moderate', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text('${co2values1.start.round()} --- ${co2values1.end.round()}', style: TextStyle(color: Colors.blueAccent, fontSize: 16.0), ),

                ],

              )),
              Expanded(child: Column(
                children: <Widget>[
                  Text("Good", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text('${co2values2.start.round()} --- ${co2values2.end.round()}',style: TextStyle(fontSize: 16.0) ),
                  /*RangeSlider(

                      activeColor: Colors.greenAccent,
                      inactiveColor: Colors.black,
                      min: 1,
                      max: 500,
                      values: co2values,
                      onChanged: (val){
                        print(val);
                        setState(() {
                          co2values=val;
                        });
                      })*/
                ],
              )
              ),
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.all(20),

          // Optional
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("""CO""" ''
              """(mV)""", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Poor", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  //Text('${NOxValues.start.round()} --- ${NOxValues.end.round()}', style: TextStyle(color: Colors.red),),
                  Text(' Above ${covalues3.start.round()} ', style: TextStyle(color: Colors.red, fontSize: 16.0), ),
                ],
              ),
              ),
              Expanded(child:
              Column(
                children: <Widget>[
                  Text('Moderate', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text('${covalues1.start.round()} --- ${covalues1.end.round()}', style: TextStyle(color: Colors.blueAccent, fontSize: 16.0), ),

                ],

              )),
              Expanded(child: Column(
                children: <Widget>[
                  Text("Good", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text('${covalues2.start.round()} --- ${covalues2.end.round()}', style: TextStyle(fontSize: 16.0), ),
                ],
              )
              ),
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.all(20),

          // Optional
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text("""
Temperature""" ''
      , style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(
                      """
(Celsius)""", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                ],
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Poor", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text(' Above ${temp.start.round()}', style: TextStyle(color: Colors.red, fontSize: 16.0),),

                ],
              ),
              ),
              Expanded(child:
              Column(
                children: <Widget>[
                  Text(''),
                  Text(''),

                ],

              )),
              Expanded(child: Column(
                children: <Widget>[
                  Text("Good", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text(' Below ${goodtemp.end.round()}', style: TextStyle(fontSize: 16.0), ),

                ],
              )
              ),
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.all(20),

          // Optional
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("""
Humidity""" '' """(%)""", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Poor", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text('Above ${humidity.start.round()}', style: TextStyle(color: Colors.red, fontSize: 16.0),),
                ],
              ),
              ),
              Expanded(child:
              Column(
                children: <Widget>[
                  Text(''),
                  Text(''),

                ],

              )),
              Expanded(child: Column(
                children: <Widget>[
                  Text("Good", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  Text(''),
                  Text("${goodhumidvalues.start.round()} -- ${goodhumidvalues.end.round()}", style: TextStyle(fontSize: 16.0), ),

                ],
              )
              ),
            ],
          ),
        )

                ],
              ),
              );
             /* Expanded(child: Column(
                children: <Widget>[
                  Text("Good"),
                  RangeSlider(

                      activeColor: Colors.greenAccent,
                      inactiveColor: Colors.black,
                      min: _co2lower,
                      max: _co2upper,
                      values: co2values,
                      onChanged: (val){
                        print(val);
                        setState(() {
                          co2values=val;
                        });
                      })
                ],
              )
              ),*/




        /*Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              // Optional
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CO"),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Severe"),
                      Text(">1000"),
                      RangeSlider(

                          activeColor: Colors.red,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  ),
                  ),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text("Average"),
                      RangeSlider(
                          activeColor: Colors.yellowAccent,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  ),
                  ),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text("Good"),
                      RangeSlider(

                          activeColor: Colors.greenAccent,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  )
                  ),
                ],
              ),
            ),
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              // Optional
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NOX"),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Severe"),
                      Text(">1000"),
                      RangeSlider(

                          activeColor: Colors.red,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  ),
                  ),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text("Average"),
                      RangeSlider(
                          activeColor: Colors.yellowAccent,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  ),
                  ),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text("Good"),
                      RangeSlider(

                          activeColor: Colors.greenAccent,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  )
                  ),
                ],
              ),
            )
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              // Optional
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Humidity"),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Severe"),
                      Text(">80"),
                      RangeSlider(

                          activeColor: Colors.red,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  ),
                  ),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text("Average"),
                      RangeSlider(
                          activeColor: Colors.yellowAccent,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  ),
                  ),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text("Good"),
                      RangeSlider(

                          activeColor: Colors.greenAccent,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  )
                  ),
                ],
              ),
            ),
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              // Optional
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Temperature"),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Severe"),
                      Text(">45"),
                      RangeSlider(

                          activeColor: Colors.red,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  ),
                  ),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text("Average"),
                      RangeSlider(
                          activeColor: Colors.yellowAccent,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  ),
                  ),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text("Good"),
                      RangeSlider(

                          activeColor: Colors.greenAccent,
                          inactiveColor: Colors.black,
                          min: _co2lower,
                          max: _co2upper,
                          values: co2values,
                          onChanged: (val){
                            print(val);
                            setState(() {
                              co2values=val;
                            });
                          })
                    ],
                  )

                  ),*/
  }
}
