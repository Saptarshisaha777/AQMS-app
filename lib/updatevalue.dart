import 'package:flutter/material.dart';
import 'package:flutter_app/extraction.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pollution Measuring & Prediction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpdatePage(),
    );
  }
}

class UpdatePage extends StatefulWidget {


  final String channelId;
  final String apiKEY;
  final String fromDate;
  final String toDate;

  UpdatePage(
      {@required this.channelId,
        @required this.apiKEY,
        @required this.fromDate,
        @required this.toDate,
      }
      );
  @override
  _UpdatePageState createState() => _UpdatePageState();
}


class _UpdatePageState extends State<UpdatePage> {

  Future<List<JSON_ROW>> updatedata() async {
    final http.Response response = await http.put(
      'http://aqmapi.herokuapp.com/api/data/gettableduration/' +
          '${widget.channelId}/' + '${widget.apiKEY}/' + '${widget.fromDate}/' +
          '${widget.toDate}',
    );
    List<AQMS> aqms = [];
    List<JSON_ROW> rows = [];

    if (response.statusCode == 200) {
      //print(response.body);
      var notesJson = json.decode(response.body);
      //print(notesJson['data']['row']);
      var i = 0;
      var n = notesJson['data']['row'].length;
      print(n);

      for (i = 0; i < n; i++) {
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
      for (var item in aqms) {
        if (j < 7) {
          j = j + 1;
          continue;
        }
        switch (j % 7) {
          case 0:
            {
              entry_id = item.value;
            }
            break;
          case 1:
            {
              created_at = item.value;
            }
            break;
          case 2:
            {
              no2 = item.value;
            }
            break;
          case 3:
            {
              co2 = item.value;
            }
            break;
          case 4:
            {
              temp = item.value;
            }
            break;
          case 5:
            {
              humid = item.value;
            }
            break;
          case 6:
            {
              co = item.value;
              JSON_ROW row = JSON_ROW(
                  entry_id,
                  created_at,
                  no2,
                  co2,
                  temp,
                  humid,
                  co);
              rows.add(row);
            }
            break;
        }

        j = j + 1;
      }


      for (var item in rows) {
        print(
            '${item.entry_id} ${item.created_at} ${item.no2} ${item.co2} ${item
                .temp} ${item.humid} ${item.co} ');
      }
      //return aqms;
      return rows;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update album.');
    }
  }

  Future<List<JSON_ROW>> _futuredata;

  @override
  void initState() {
    super.initState();
    _futuredata = updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Air Pollution Measuring & Detection App"),
        ),
        body: Center(
            child: Column(
                children: [
                  ElevatedButton(
                    child: Text('Update Data'),
                    onPressed: () {
                      setState(() {
                        _futuredata = updatedata();
                      });
                    },
                  ),
                ]
            )
        )
    );
  }
}
