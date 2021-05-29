import 'dart:async';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
//import "dart:html";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Ranges.dart';
import 'package:flutter_app/singleData.dart';
import 'package:flutter_app/updatevalue.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/aqmdetails.dart';



class AQMS {
  final String value;
  final String colour;
  final String description;

  AQMS(this.value, this.colour, this.description);

  factory AQMS.fromJon(Map<String, dynamic> json) {
    value: json['value'];
    colour: json['colour'];
    description: json['description'];
  }

}

class JSON_ROW {
  final String entry_id;
  final String created_at;
  final String no2;
  final String co2;
  final String temp;
  final String humid;
  final String co;

  JSON_ROW(this.entry_id,this.created_at,this.no2,this.co2,this.temp,this.humid,this.co);

  factory JSON_ROW.fromAQMS(String entryId,String createdAt,String no2,String co2,
      String temp,String humid,String co){
    entry_id : entryId;
    created_at : createdAt;
    no2 : no2;
    co2 : co2;
    temp : temp;
    humid : humid;


  }

}


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
  home: Extraction(),
  );
  }
  }
  class Extraction extends StatefulWidget {
    final String channelId;
    final String apiKEY;
    final String fromDate;
    final String toDate;


    Extraction(
        {@required this.channelId,
         @required this.apiKEY,
          @required this.fromDate,
          @required this.toDate
        }
        );
  @override
  _ExtractionState createState() => _ExtractionState();
  }
class _ExtractionState extends State<Extraction>{


  Future<List<JSON_ROW>> fetchdata() async {
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
      print(n);

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
        print('${item.entry_id} ${item.created_at} ${item.no2} ${item.co2} ${item.temp} ${item.humid} ${item.co} ');
      }
      //return aqms;
      return rows;

    }

  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Pollution Monitoring',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Air Pollution Measuring & Detection App'),
          ),
          drawer: new Drawer(
            child: ListView(
              children: [
                new ListTile(
                  title: Text('Show Ranges'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => MyRanges())
                    );
                  },
                ),
              ],
            ),
          ),
          body: Container(
            child: FutureBuilder(
                future: fetchdata(),
                builder: (BuildContext context,AsyncSnapshot snapshot) {
                  if(snapshot.data==null){
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  else {

                    //return ListView.builder(itemBuilder: (context, index) {
                    //  return Card(
                    //    child: Padding(
                    //      padding: const EdgeInsets.all(8.0),
                    //      child: Column(
                    //        children: <Widget>[
                    //          Text(
                    //            snapshot.data[index].entry_id,
                    //            style: TextStyle(
                    //              fontSize: 22,
                    //              fontWeight: FontWeight.bold,
                    //            ),
                    //          ),
                    //          Text(
                    //            snapshot.data[index].no2,
                    //            style: TextStyle(
                    //              fontSize: 18,
                    //              fontWeight: FontWeight.bold,
                    //            ),
                    //          ),
                    //          Text(
                    //            snapshot.data[index].co2,
                    //            style: TextStyle(
                    //              fontSize: 18,
                    //              fontWeight: FontWeight.bold,
                    //            ),
                    //          ),
                    //        ],
                    //      ),
                    //    ),
                    //  );
                    //},
                    //  itemCount: snapshot.data.length,);



                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('ENTRY ID',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),tooltip: ''),
                            DataColumn(label: Text('CREATED AT',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),tooltip: ''),
                            DataColumn(label: Text('NO2',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),tooltip: ''),
                            DataColumn(label: Text('CO2',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),tooltip: ''),
                            DataColumn(label: Text('TEMPERATURE',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),tooltip: ''),
                            DataColumn(label: Text('HUMIDITY',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),tooltip: ''),
                            DataColumn(label: Text('CO',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),tooltip: ''),
                          ],
                          rows: List.generate(snapshot.data.length,(index) =>
                              DataRow(
                                  cells: [
                                    DataCell(Text(snapshot.data[index].entry_id),
                                        onTap:(){Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Details_Page(),
                                            settings: RouteSettings(
                                              arguments: snapshot.data[index],
                                            )
                                        ),
                                        );
                                        }
                                    ),
                                    DataCell(Text(snapshot.data[index].created_at),
                                        onTap:(){Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Details_Page(),
                                            settings: RouteSettings(
                                              arguments: snapshot.data[index],
                                            )
                                        ),
                                        );
                                        }
                                    ),
                                    DataCell(Text(snapshot.data[index].no2),
                                        onTap:(){Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Details_Page(),
                                            settings: RouteSettings(
                                              arguments: snapshot.data[index],
                                            )
                                        ),
                                        );
                                        }),
                                    DataCell(Text(snapshot.data[index].co2),
                                        onTap:(){Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Details_Page(),
                                            settings: RouteSettings(
                                              arguments: snapshot.data[index],
                                            )
                                        ),
                                        );
                                        }),
                                    DataCell(Text(snapshot.data[index].temp),
                                        onTap:(){Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Details_Page(),
                                            settings: RouteSettings(
                                              arguments: snapshot.data[index],
                                            )
                                        ),
                                        );
                                        }),
                                    DataCell(Text(snapshot.data[index].humid),
                                        onTap:(){Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Details_Page(),
                                            settings: RouteSettings(
                                              arguments: snapshot.data[index],
                                            )
                                        ),
                                        );
                                        }),
                                    DataCell(Text(snapshot.data[index].co),
                                        onTap:(){Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Details_Page(),
                                            settings: RouteSettings(
                                              arguments: snapshot.data[index],
                                            )
                                        ),
                                        );
                                        }),
                                  ]

                              )
                          ),
                        ),
                      ),
                    );
                  }
                }
            ),
          )
      ),
    );
  }
}
