import 'dart:async';


enum CounterAction{
  increment,
  decrement,
  reset
}

class CounterBloc{
  int? counter;
  final _stateStreamController=StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc(){
    counter=0;
    eventStream.listen((event) {
      if(event==CounterAction.increment){
        counter=counter! +1;
      }

      else if(event==CounterAction.decrement){
        counter=counter! -1;
      }

      else if(event==CounterAction.reset){
        counter=0;
      }
      counterSink.add(counter!);
    });

  }
  
}