import 'package:flutter/material.dart';
import 'package:project_pomodoro/components/input_time.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Placeholder(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              InputTime(value: 25, title: 'Work'),
              InputTime(value: 25, title: 'Rest'),
            ],
          )
        ],
      ),
    );
  }
}
