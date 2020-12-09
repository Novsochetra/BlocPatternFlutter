import 'package:BlocPatterLearning/third-way/bloc/bloc_counter.dart';
import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  CounterApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final counterBloc =  CounterBloc();

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                
                StreamBuilder(
                  stream: counterBloc.getCounterBehaviour.stream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(
                     '${snapshot.data}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                ),
                 
               StreamBuilder<Object>(
                 stream: counterBloc.getCounterBehaviour.stream,
                 initialData: 0,
                 builder: (context, snapshot) {
                   return Text(
                      'Third Way, have been update times ${snapshot.data}',
                    );
                 }
               ), 
                  
              ],
            )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
