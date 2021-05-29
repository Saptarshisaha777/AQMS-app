import 'package:flutter/material.dart';
import 'dart:math' as math;

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
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedPage(),
    );
  }
}

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> with TickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
        title: Text("Pollution Detection Development App",
        textAlign: TextAlign.center,

    ),
    ),
    body: Column(
      children: <Widget>[
        AnimatedBuilder(animation: _controller,
      child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.green,
          child: const Center(
            child: Text('Whee!'),
          ),
      ),
            builder: (BuildContext context, Widget child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            },
        ),
        TweenAnimationBuilder(tween: Tween() , duration: null, builder: null)
      ],
    )
    );
  }
}
