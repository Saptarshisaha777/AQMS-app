import 'package:flutter/material.dart';
//import 'package:pollution_monitor1/UTILS/ApiManager.dart';
import 'package:flutter_app/banner.dart';
import 'package:flutter_app/colorgauge.dart';
import 'package:flutter_app/extraction.dart';

class Details_Page extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details_Page> {
  //final JSON_ROW json_row = ModalRoute.of(context).settings.arguments;

  //_DetailsState({Key key,@required this.json_row}) : super(key: key);


  @override
  void initState() {
    //apiManager = ApiManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, String>>> data() async {
      final JSON_ROW json_row = ModalRoute
          .of(context)
          .settings
          .arguments;
      print(json_row.entry_id);
      print('${json_row.entry_id} ${json_row.created_at} ${json_row.no2} ${json_row.co2} ${json_row.temp} ${json_row.humid} ${json_row.co} ');

      List<Map<String, String>> valList = [];
      Map<String, String> eachAqms = {};

      eachAqms['entry_id'] = json_row.entry_id;
      valList.add(eachAqms);
      eachAqms['Created At'] = json_row.created_at;
      valList.add(eachAqms);
      eachAqms['NO2'] = json_row.no2 + '  mV';
      valList.add(eachAqms);
      eachAqms['CO'] = json_row.co + '  mV';
      valList.add(eachAqms);
      eachAqms['CO2'] = json_row.co2 +  '  ppm';
      valList.add(eachAqms);
      eachAqms['Temperature'] = json_row.temp + '  Celsius';
      valList.add(eachAqms);
      eachAqms['Humidity'] = json_row.humid + '  %';
      valList.add(eachAqms);

      return valList;
    }
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color(0xfff5f5f5),
          appBar: AppBar(
            actions: <Widget>[

            ],
            automaticallyImplyLeading: true,
            //backgroundColor: Colors.grey,
            title: Text("Air Pollution Measuring & Detection App"),

          ),
          body: FutureBuilder(
            future: data(), //apiManager.getAqms(),
            builder: (ctx, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                return ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, int index) {
                        return GestureDetector(
                          onTap: (){
                            print('hello');
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            Detail_Gauge(
                              title: snapshot.data[index].keys.toList()[index],
                              val: snapshot.data[index].values.toList()[index],
                            )
                            ),);
                          },

                          child : BannerPanel(
                          title: snapshot.data[index].keys.toList()[index],
                          value: snapshot.data[index].values.toList()[index],
                        ),
                        );
                      },
                    ),
                  ],
                );
              }
            },
          )),
    );
  }
}

