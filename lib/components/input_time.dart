import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project_pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class InputTime extends StatelessWidget {
  const InputTime({
    required this.value,
    required this.title,
    required this.addTime,
    required this.decreaseTime,
    super.key,
  });

  final int value;
  final String title;
  final void Function()? addTime;
  final void Function()? decreaseTime;

  @override
  Widget build(BuildContext context) {
    final pomodoro = Provider.of<PomodoreStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Observer(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decreaseTime,
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor:
                        pomodoro.isWorking() ? Colors.red : Colors.green),
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
              Text(
                '$value min',
                style: const TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: addTime,
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor:
                        pomodoro.isWorking() ? Colors.red : Colors.green),
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
