import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Air Pollution Measuring & Detection App"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/NIT.png'),
              height: 100.0,
              width: 100.0,
            ),
            Text(
              "Login Page",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,

            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value; // get value from TextField
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
                password = value; //get value from textField
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
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    print(newUser.toString());

                    if (newUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyStatelessWidget()),
                      );
                      setState(() {
                        showProgress = false;
                      });
                    }
                  } catch (e) {}
                },
                minWidth: 200.0,
                height: 45.0,
                child: Text(
                  "Login",
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}