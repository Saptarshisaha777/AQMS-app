//import 'package:flutter/material.dart';

//import 'UI/home.dart';

//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Home(),
//    );
//  }
//}
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter_app/buttons.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'extraction.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: pain22(),
    );
  }
}

class pain22 extends StatefulWidget {
  final String title;
  final String channelId;
  final String apiKEY;
  final String fromDate;
  final String toDate;
   pain22({Key key,
     @required this.title,
     @required this.channelId,
     @required this.apiKEY,
     @required this.fromDate,
     this.toDate}) : super(key: key);
  @override
  _pain22State createState() => _pain22State();
}
class _pain22State extends State<pain22>{

//  @override
//  State<StatefulWidget>createState(){
//    return _pain22State();
//  }
//}
//// This widget is the root of your application.
//class _pain22State extends State<pain22> {
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//
//        primarySwatch: Colors.blue,
//
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: MyGraph(),
//    );
//  }
//}
//
//class MyGraph extends StatefulWidget {
//  @override
//  _MyGraphState createState() => _MyGraphState();
//}
//
//class _MyGraphState extends State<MyGraph> {

  double graph_val(snapshot,index) {
    if(widget.title=='NO2'){
      return double.parse(snapshot.data[index].no2);
    }
    else if(widget.title=='CO2'){
      return double.parse(snapshot.data[index].co2);
    }
    else if(widget.title=='CO'){
      return double.parse(snapshot.data[index].co);
    }
    else if(widget.title=='Temperature'){
      return double.parse(snapshot.data[index].temp);
    }
    else if(widget.title=='Humidity'){
      return double.parse(snapshot.data[index].humid);
    }
    else{
      return 1000;
    }

  }


  Future<List<JSON_ROW>> fetchdata2() async {
    var url = 'http://aqmapi.herokuapp.com/api/data/gettableduration/' + '${widget.channelId}/' + '${widget.apiKEY}/' + '${widget.fromDate}/'+'${widget.toDate}';
    var response = await http.get(url);
    print("/${widget.apiKEY}/");
    print("${widget.fromDate}");
    print("${widget.toDate}");

    List<AQMS> aqms = [];
    List<JSON_ROW> rows = [];

    if (response.statusCode == 200) {
      //print(response.body);
      var notesJson = json.decode(response.body);
      //print(notesJson['data']['row']);
      var i =0;
      var n=notesJson['data']['row'].length;
      //print(n);

      for(i=0;i<n;i++) {
        for (var noteJson in notesJson['data']['row'][i]) {
          //print("$noteJson");


          AQMS user = AQMS(
              noteJson['value'], noteJson['colour'], noteJson['description']);

          aqms.add(user);
        }
      }
      var j = 0;
      String entry_id;
      String created_at;
      String no2;
      String co2;
      String temp;
      String humid;
      String co;
      for(var item in aqms){

        if(j<7){

          j=j+1;
          continue;
        }
        switch(j%7){
          case 0: {

            entry_id = item.value;
          }
          break;
          case 1: {
            created_at = item.value;
          }
          break;
          case 2: {
            no2 = item.value;
          }
          break;
          case 3: {
            co2 = item.value;
          }
          break;
          case 4: {
            temp = item.value;
          }
          break;
          case 5: {
            humid = item.value;
          }
          break;
          case 6: {
            co = item.value;
            JSON_ROW row =  JSON_ROW(entry_id, created_at, no2, co2, temp, humid, co);
            rows.add(row);
          }
          break;
        }

        j = j+1;
      }


      for(var item in rows){
        //print('${item.entry_id} ${item.created_at} ${item.no2} ${item.co2} ${item.temp} ${item.humid} ${item.co} ');
      }
      //return aqms;

      return rows;

    }

  }

   TrackballBehavior _trackballBehavior;
@override
  void initState(){
    _trackballBehavior = TrackballBehavior(
      // Enables the trackball
        enable: true,
        tooltipSettings: InteractiveTooltip(
            enable: true,
            color: Colors.red
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    //var data_val = fetchdata2();
    return Scaffold(
        appBar: AppBar(
          title: Text("Air Pollution Measuring & Detection App", textAlign: TextAlign.center,),

        ),

        body: Center(
          child:


          Container(

            child:
            FutureBuilder(
              future: fetchdata2(),
              builder: (BuildContext context,AsyncSnapshot snapshot) {
                if(snapshot.data==null){
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                else {
                  //print(snapshot.data);
                  return Container(
                    child: SfCartesianChart(
                        trackballBehavior: _trackballBehavior,
                      primaryXAxis: CategoryAxis(),
                        title: ChartTitle(
                            text: widget.title,
                            //backgroundColor: Colors.grey,
                            borderColor: Colors.black45,
                            borderWidth: 2,
                            // Aligns the chart title to left
                            alignment: ChartAlignment.near,
                            textStyle: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                            )
                        ),
                        zoomPanBehavior: ZoomPanBehavior(
                          enableDoubleTapZooming: true,
                          enablePinching: true,
                          zoomMode: ZoomMode.x,
                          enablePanning: true,
                        ),
                        series: <ChartSeries<AQMSData, int>>[
                          // Renders fast line chart
                          LineSeries<AQMSData, int > (
                            dataSource: //new List<SalesData>.generate(10,(index) => SalesData(index+1.1, index+10.43*5)),
                            List.generate(snapshot.data.length,(index) =>
                            new AQMSData(int.parse(snapshot.data[index].entry_id), graph_val(snapshot, index)),),

                            xValueMapper: (AQMSData datas, _) => datas.id,
                            yValueMapper: (AQMSData datas, _) => datas.val,

                          ),
                        ]
                    ),

                  );
                }
              },
            ),
          ),
        )
    );
  }
}

class SalesData {
  SalesData(this.time, this.no2){
    print(time);
    print(no2);
  }

  final double time;
  final double no2;


}

class AQMSData {
  AQMSData(this.id, this.val){
    print(id);
    print(val);
  }

  final int id;
  final double val;


}