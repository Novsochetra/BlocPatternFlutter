
import 'dart:async';

enum IAction {
  INCREMENT,
  DECREMENT,
  RESET
}

class CounterBloc {
  int counter;

  final _stateStreamController = StreamController<int>.broadcast();
  StreamSink<int> get _counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<IAction>();
  StreamSink<IAction> get eventSink => _eventStreamController.sink;
  Stream<IAction> get _eventStream => _eventStreamController.stream;

  // int get counterValue => _counter;

  CounterBloc() {
    counter = 0;
    _eventStream.listen((event) {
      if(event == IAction.INCREMENT) {
        counter++;
      } else if(event == IAction.DECREMENT) {
        counter--;
      } else  if (event == IAction.RESET) {
        counter = 0;
      }
      _counterSink.add(counter);
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}