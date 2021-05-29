import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/adddetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pollution Detection & Development',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyRegisterPage(),
    );
  }
}

class MyRegisterPage extends StatefulWidget {
  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage>{

  bool showProgress = false;

  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Air Pollution Measuring & Detection App",
          textAlign: TextAlign.center,

        ),
      ),
      body:


      Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage('assets/NIT.png'),
              height: 100.0,
              width: 100.0,

            ),
            Text(
              "Register here",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value; //get the value entered by user.
              },
              decoration: InputDecoration(
                  hintText: "Enter your Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)))),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value; //get the value entered by user.
              },
              decoration: InputDecoration(
                  hintText: "Enter your Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)))),
            ),
            SizedBox(
              height: 20.0,
            ),
            Material(
              elevation: 5,
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(32.0),
              child: MaterialButton(
                onPressed: () async {
                  setState(() {
                    showProgress = true;
                  });
                  try {
                    final newUser =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, password: password);
                    print(newUser.toString());

                    if (newUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyLoginPage()),
                      );
                      showDialog(context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            child: Text("You are registered successfully",
                            style: TextStyle(color: Colors.green, backgroundColor: Colors.white10),),
                          ),
                        );
                      });
                    }
                    else{
                      Text("*Required",
                      style: TextStyle(color: Colors.redAccent),);
                    }

                    setState(() {
                      showProgress = false;
                    });
                  } catch (e) {}
                },

                minWidth: 200.0,
                height: 45.0,
                child: Text(
                  "Register",
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLoginPage()),
                );
              },
              child: Text(
                "Already Registered? Login Now",
                style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
    );
  }
}