import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Ranges.dart';
import 'package:flutter_app/datapage.dart';
import 'package:flutter_app/extraction.dart';
import 'package:flutter_app/extraction2.dart';
import 'package:intl/intl.dart';

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
      home: GraphPage(),
    );
  }
}

DateTime selectedDate = DateTime.now();
TextEditingController _date1 = new TextEditingController();
TextEditingController _date2 = new TextEditingController();
TextEditingController channelID= new TextEditingController();
TextEditingController apiKey= new TextEditingController();

class GraphPage extends StatefulWidget{

  @override
  _GraphPageState createState() => _GraphPageState();
  final String title;
  GraphPage({
    @required this.title
});

}


class _GraphPageState extends State<GraphPage> {
  TextEditingController channelID= new TextEditingController();
  TextEditingController apiKey= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Back to home page',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        title: Text("Air Pollution Measuring & Detection App"),
      ),
      body: Center(

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                "Enter the details",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),

              SizedBox(
                height: 20.0,

              ),
              TextField(
                textAlign: TextAlign.center,

                controller: channelID,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  // ignore: deprecated_member_use
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: "Enter the channel id",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                controller: apiKey,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  // ignore: deprecated_member_use
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: "Enter api key number",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onTap: () => _selectDate(context),
                style: TextStyle(
                    fontSize: 12.0
                ),
                controller: _date1,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: Colors.white,
                  hintText: 'from',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
                ),
                onSaved: (value3) => _date1  = value3 as TextEditingController,
              ),
              TextFormField(
                onTap: () => _selectDate1(context),
                style: TextStyle(
                    fontSize: 12.0
                ),
                controller: _date2,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: Colors.white,
                  hintText: 'to',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
                ),
                onSaved: (value4) => _date2  = value4 as TextEditingController,
              ),
              Material(
                elevation: 5,
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                    child:Text(
                      'Show graph',
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                    ),
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  pain22(title: widget.title, channelId: channelID.text, apiKEY: apiKey.text, fromDate: _date1.text, toDate: _date2.text,)));

                    }

                ),
              ),
            ]
        ),
      ),
    );
  }
}

Future<Null> _selectDate(BuildContext context) async {
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1901, 1),
      lastDate: DateTime(2100));
  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
    _date1.value = TextEditingValue(text: formatter.format(picked));
  }

}

Future<Null> _selectDate1(BuildContext context) async {

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1901, 1),
      lastDate: DateTime(2100));
  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
    _date2.value = TextEditingValue(text: formatter.format(picked));
  }

}