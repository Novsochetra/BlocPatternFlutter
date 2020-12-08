import 'package:BlocPatterLearning/second-way/ui/counter_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterApp(title: 'Counter App'),
    );
  }
}
