import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store{

  @observable
  int counter = 0;

  @action
  void add (){
    counter++;
  }
}