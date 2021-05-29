import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/adddetails.dart';
import 'package:flutter_app/aqmdetails.dart';
import 'package:flutter_app/buttons.dart';
import 'package:flutter_app/datapage.dart';
import 'package:flutter_app/details.dart';
import 'package:flutter_app/extraction2.dart';

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
  static const String _title = 'HOME';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyStatelessWidget(),
    );
  }
}
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState> ();
final SnackBar snackBar = const SnackBar(content: Text('Showing SnackBar'));

void openPage(BuildContext context){
  Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: const Text('About This APP'),
          ),
          body: const Center(
            child: Text(
              'All the info about the app & what it does will be here.'
                  '',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      }
  ));
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Air Pollution Measuring & Detection App Homepage'),
          actions: <Widget>[
            /*IconButton(
              icon: const Icon(Icons.person_add),
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              },
              tooltip: 'Add a member',
            ),*/
            /*IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next page',
              onPressed: () {
              },
            )*/
          ],
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(30),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.amber,
              child: IconButton(
                  icon:  const Icon(Icons.view_list),
                  color: Colors.greenAccent,
                  iconSize: 100,
                  tooltip: 'View Data',
                  onPressed: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyAqmPage()),
                      );
                    }
                  }
              ),


            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.lightBlue,
              child: IconButton(
                  icon: const Icon(Icons.add_chart),
                  iconSize: 100,
                  tooltip: 'View Graph',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyButton()),
                    );

                  }

              ),
            ),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              color: Colors.lightGreenAccent,
              child: IconButton(
                icon: const Icon(Icons.system_update_alt_outlined),
                iconSize: 100,
                color: Colors.blueGrey,
                tooltip: 'Retrieve Data',
                onPressed: () {

                },

              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              color: Colors.purpleAccent,
              child: IconButton(
                icon: const Icon(Icons.info_outline),
                iconSize: 100,
                color: Colors.blueGrey,
                tooltip: 'About this app',
                onPressed: () {
                  openPage(context);
                },

              ),
            ),

            //Container(
              //padding: const EdgeInsets.all(8),
              /*color: Colors.cyan,
              child: IconButton(
                icon: const Icon(Icons.info_outline),
                iconSize: 100,
                tooltip: 'About us',
                onPressed: () {
                  openPage(context);
                },*/



          ],
        )
    );
  }
}
void openSecondPage(BuildContext context){
  Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Profile'),
          ),
          body: Center(

            child: RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyDetailPage()),
              );
        },
        ),
        ),
        );
          },

          ),
        );
        }