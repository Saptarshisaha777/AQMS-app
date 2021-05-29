
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/adddetails.dart';
import 'package:flutter_app/details.dart';
import 'package:flutter_app/registration.dart';
import 'login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WELCOME',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimation(),
    );
  }
}
class MyAnimation extends StatefulWidget {
  final String title;

  MyAnimation({Key key, this.title}) : super(key: key);

  @override
  _MyAnimationState createState() => _MyAnimationState();
}

// The State class is responsible for two things: holding some data you can
// update and building the UI using that data.
class _MyAnimationState extends State<MyAnimation> {
  // Whether the green box should be visible
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          selected = !selected;
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage()));
        });
      },
    child: Center(
    child: AnimatedContainer(
      constraints: BoxConstraints.expand(),

      duration: const Duration(seconds: 2),
      curve: Curves.easeOutCirc,
      child:  Image.asset('pollution.jpg', fit: BoxFit.cover,),
    ),
),
    );


  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(

        child :AnimatedContainer(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/pollution.jpg'),
                  fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.white.withOpacity(1.0), BlendMode.softLight),

                    ),
          ),
        duration: Duration(seconds: 1),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[


            Image(
              image: AssetImage('assets/NIT.png'),
              height: 300.0,
              width: 300.0,

            ),
            Text(
              "National Institute of Technology, Agartala",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35.0),
              textAlign: TextAlign.center,
            ),
            AnimatedDefaultTextStyle(child: Text("Department of Electronics & Communication Engineering",textAlign: TextAlign.center, ),
              softWrap: true,
              overflow: TextOverflow.clip,
              style: TextStyle(color: Colors.red,fontWeight: FontWeight.w700, fontSize: 22.0,),
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
            ),
            RaisedButton(

              child: Text("Register",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: Colors.white),),
                color: Colors.purple,
                splashColor: Colors.pinkAccent,
                elevation: 10.0,
                focusElevation: 2.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyRegisterPage()),
                );
              }
              ),
            RaisedButton(

                child: Text("Login",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: Colors.white),),
                color: Colors.purple,
                splashColor: Colors.pinkAccent,
                elevation: 10.0,
                focusElevation: 2.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyLoginPage()),
                  );
                }
            ),
          ],
        ),
        ),
      ),
    );
  }
}