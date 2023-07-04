import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoreStore = _PomodoroStore with _$PomodoreStore;

enum TimeIntervalType {
  work,
  rest
}

abstract class _PomodoroStore with Store {

  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  bool hasStarted = false;

  @observable
  TimeIntervalType type = TimeIntervalType.rest;

  @observable
  Timer? cronometer;

  @action
  void addWorkTime() {
    workTime++;

    if(isWorking()){
      resetTimer();
    }
  }

  @action
  void decreaseWorkTime() {
    if (workTime == 0) {
      return;
    }
    workTime--;

    if (isWorking()) {
      resetTimer();
    }
  }

  @action
  void addRestTime() {
    restTime++;

    if (isResting()) {
      resetTimer();
    }
  }

  @action
  void decreaseRestTime() {
    if (restTime == 0) {
      return;
    }

    restTime--;

    if (isResting()) {
      resetTimer();
    }
  }

  @action
  void start() {
    hasStarted = true;
    cronometer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    hasStarted = false;
    cronometer?.cancel();

  }

  @action
  void resetTimer() {
    stop();
    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
  }

  bool isWorking() {
    return type == TimeIntervalType.work;
  }

  bool isResting() {
    return type == TimeIntervalType.rest;
  }

  void _changeType() {
    if (isWorking()) {
      type = TimeIntervalType.rest;
      minutes = restTime;
      seconds = 0;
    } else {
      type = TimeIntervalType.work;
      minutes = workTime;
      seconds = 0;
    }
  }
}
