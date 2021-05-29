import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
//import 'package:pollution_monitor1/UTILS/ApiManager.dart';
import 'package:flutter_app/banner.dart';
import 'package:flutter_app/singleData.dart';

class Detail_Gauge extends StatelessWidget {
  final String title, val;



  const Detail_Gauge({Key key, this.title, this.val}) : super(key: key);

  double min_range() {

    return 0;


  }

  double max_range() {
    if(title=='NO2'){
      return 2000;
    }
    else if(title=='CO2'){
      return 2000;
    }
    else if(title=='CO'){
      return 2000;
    }
    else if(title=='Temperature'){
      return 50;
    }
    else if(title=='Humidity'){
      return 100;
    }
    else{
      return 1000;
    }

  }

  double interval_range() {
    if(title=='NO2'){
      return 100;
    }
    else if(title=='CO2'){
      return 100;
    }
    else if(title=='CO'){
      return 100;
    }
    else if(title=='Temperature'){
      return 5;
    }
    else if(title=='Humidity'){
      return 10;
    }
    else{
      return 10;
    }

  }

  dynamic gauge_range() {
    if(title=='NO2'){
      return <GaugeRange>[
        GaugeRange(startValue: 0, endValue: 1200,color: Colors.green),
        GaugeRange(startValue: 1200, endValue: 1600,color: Colors.blue),
        //GaugeRange(startValue: 50, endValue: 75,color: Colors.blue),
        GaugeRange(startValue: 1600, endValue: 2000,color: Colors.red),

      ];
    }
    else if(title=='CO2'){
      return <GaugeRange>[
        //GaugeRange(startValue: 0, endValue: 350,color: Colors.orange),
        GaugeRange(startValue: 0, endValue: 600,color: Colors.green),
        GaugeRange(startValue: 600, endValue: 1000,color: Colors.blue),
        GaugeRange(startValue: 1000, endValue: 2000,color: Colors.red),

      ];;
    }
    else if(title=='CO'){
      return <GaugeRange>[
        GaugeRange(startValue: 0, endValue: 1200,color: Colors.green),
        GaugeRange(startValue: 1200, endValue: 1600,color: Colors.blue),
        //GaugeRange(startValue: 50, endValue: 75,color: Colors.blue),
        GaugeRange(startValue: 1600, endValue: 2000,color: Colors.red),

      ];;
    }
    else if(title=='Temperature'){
      return <GaugeRange>[
        GaugeRange(startValue: 0, endValue: 35,color: Colors.green),
        //GaugeRange(startValue: 1200, endValue: 1600,color: Colors.blue),
        //GaugeRange(startValue: 50, endValue: 75,color: Colors.blue),
        GaugeRange(startValue: 35, endValue: 50,color: Colors.red),

      ];;
    }
    else if(title=='Humidity'){
      return <GaugeRange>[
        GaugeRange(startValue: 0, endValue: 80,color: Colors.green),
        //GaugeRange(startValue: 1200, endValue: 1600,color: Colors.blue),
        //GaugeRange(startValue: 50, endValue: 75,color: Colors.blue),
        GaugeRange(startValue: 80, endValue: 100,color: Colors.red),

      ];
    }
    else{
      return 10;
    }

  }

  double changetype() {
    var s = val;
    s=s.replaceAll(RegExp(r'[^0-9.]+'), '');
    print(s);
    print(title);
    return double.parse(s);

  }
//  @override
//  _Detail_GaugeState createState() => _Detail_GaugeState();
//}

//class _Detail_GaugeState extends State<Detail_Gauge> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Color(0xfff5f5f5),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: new IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
              Navigator.pop(context);
            }),
            //backgroundColor: Colors.grey,
            title: Text(title,textAlign: TextAlign.center,),
          ),
          body: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: min_range(),
                maximum: max_range(),
                interval: interval_range(),
                ranges: gauge_range(),
                pointers: <GaugePointer>[
                  NeedlePointer(value: changetype(),enableAnimation: true,)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(widget: Container(child:
                  Text(val,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                      angle: 90, positionFactor: 0.5
                  )
                ]
            )
          ],
          ),
        )
    );

  }
}