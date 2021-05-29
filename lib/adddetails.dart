import 'package:flutter/material.dart';
import 'package:flutter_app/details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/login.dart';
//import 'package:flutter_app/custom_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Official Registration Page',
      theme: ThemeData(
        primarySwatch: Colors.white,
      ),
      home: AddDetailsPage(),
    );
  }
}

class AddDetailsPage extends StatefulWidget{

  @override
  _AddDetailsPageState createState() => _AddDetailsPageState();

}


class _AddDetailsPageState extends State<AddDetailsPage> {
  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController enrollId = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final dbRef = FirebaseDatabase.instance.reference().child("registrations");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your details'),
        backgroundColor: Colors.black26,
      ),
      body: Container(
        color: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 100.0),
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: name,
                    onChanged: (value) {
                      name = value as TextEditingController;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: phone,
                    onChanged: (value) {
                      phone = value as TextEditingController;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: email,
                    onChanged: (value) {
                      email = value as TextEditingController;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: address,
                    onChanged: (value) {
                      address = value as TextEditingController;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter your address',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: enrollId,
                    onChanged: (value) {
                      enrollId = value as TextEditingController;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter college enroll number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Builder(
                    builder: (context) {
                      return RaisedButton(
                        onPressed: (){
                          var route= new MaterialPageRoute(builder:
                              (BuildContext context)=> MyDetailPage(
                            name:  name.text,
                            phone: phone.text,
                            email: email.text,
                            address: address.text,
                          )
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyLoginPage()));

                           if (_formKey.currentState.validate()) {
                            dbRef.push().set({
                            "name": name.text,
                            "phone": phone.text,
                            "mail": email.text,
                              "address": address.text,
                            }).then((_) {
                            Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully Added')));
                            name.clear();
                            phone.clear();
                            }).catchError((onError) {
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text(onError)));
                            });
                            }
                        },
                        color: Colors.blueGrey,
                        child: Text('Submit'),
                      );
                    },
                  ),
                )
              ]
          ),

        ),
      ),
    );
  }


}
