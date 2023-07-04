import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project_pomodoro/components/cronometer_button.dart';
import 'package:project_pomodoro/main.dart';
import 'package:project_pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Cronometer extends StatelessWidget {
  const Cronometer({super.key});

  @override
  Widget build(BuildContext context) {
    final pomodoro = Provider.of<PomodoreStore>(context);

    return Observer(
      builder: (_) => Container(
        color: pomodoro.isWorking() ? Colors.red : Colors.green,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pomodoro.isWorking() ? 'Time to work' : 'Time to rest',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${pomodoro.minutes.toString().padLeft(2, '0')}:${pomodoro.seconds.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 120, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!pomodoro.hasStarted)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CronometerButton(
                        label: 'Start',
                        icon: Icons.play_arrow,
                        action: pomodoro.start,
                      ),
                    ),
                  if (pomodoro.hasStarted)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CronometerButton(
                        label: 'Stop',
                        icon: Icons.stop,
                        action: pomodoro.stop,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CronometerButton(
                      label: 'Reset',
                      icon: Icons.refresh,
                      action: pomodoro.resetTimer,
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
