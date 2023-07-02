import 'package:flutter/material.dart';
import 'package:project_pomodoro/components/cronometer.dart';
import 'package:project_pomodoro/components/input_time.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: Cronometer()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                InputTime(value: 25, title: 'Work'),
                InputTime(value: 25, title: 'Rest'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
