import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project_pomodoro/components/cronometer.dart';
import 'package:project_pomodoro/components/input_time.dart';
import 'package:project_pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final pomodoro = Provider.of<PomodoreStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: Cronometer()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTime(
                    value: pomodoro.workTime,
                    title: 'Work',
                    addTime: (pomodoro.hasStarted && pomodoro.isWorking()) ? null : pomodoro.addWorkTime,
                    decreaseTime:  (pomodoro.hasStarted && pomodoro.isWorking()) ? null : pomodoro.decreaseWorkTime,
                  ),
                  InputTime(
                    value: pomodoro.restTime,
                    title: 'Rest',
                    addTime:  (pomodoro.hasStarted && pomodoro.isResting()) ? null : pomodoro.addRestTime,
                    decreaseTime:  (pomodoro.hasStarted && pomodoro.isResting()) ? null : pomodoro.decreaseRestTime,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
