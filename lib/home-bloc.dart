import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class HomeBloc implements BlocBase {
  var _streamController = BehaviorSubject<int>(seedValue: 0);
  var _streamController2 = BehaviorSubject<int>(seedValue: 0);

  Stream<int> get outCount => _streamController.stream;
  Stream<int> get outCount2 => _streamController2.stream;

  Sink<int> get inCount => _streamController.sink;
  Sink<int> get inCount2 => _streamController2.sink;

  Increment() {
    _streamController.sink.add(_streamController.value + 1);
  }

  Increment2() {
    _streamController2.sink.add(_streamController2.value + 1);
  }

  @override
  void dispose() {
    _streamController.close();
    _streamController2.close();
  }
}
