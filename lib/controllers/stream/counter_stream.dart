import 'dart:async';

class CounterStream {
  int counter = 0;
  StreamController counterController = StreamController<int>();
  Stream get counterStream => counterController.stream;

  void increase() {
    counter += 1;
    counterController.sink.add(counter);
  }

  void dispose() {
    counterController.close();
  }
}
