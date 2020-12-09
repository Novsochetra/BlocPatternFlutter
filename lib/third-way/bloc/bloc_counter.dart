import 'package:rxdart/subjects.dart';

enum IAction {
  INCREMENT,
  DECREMENT,
  RESET
}

class CounterBloc {
  int _counter = 0;

  BehaviorSubject _counterStreamController = BehaviorSubject<int>();

  incrementCounter() {
    _counter++;
    _counterStreamController.sink.add(_counter);
  }

  decrementCounter() {
    _counter--;
    _counterStreamController.sink.add(_counter);
  }

   BehaviorSubject<int> get getCounterBehaviour => _counterStreamController;

  void dispose() {
    _counterStreamController.close();
  }
}