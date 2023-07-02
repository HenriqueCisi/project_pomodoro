import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_pomodoro/components/cronometer_button.dart';

class Cronometer extends StatelessWidget {
  const Cronometer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Time to work',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '25:00',
              style: TextStyle(fontSize: 120, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CronometerButton(
                    label: 'Start',
                    icon: Icons.play_arrow,
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(10),
                //   child: CronometerButton(
                //     label: 'Stop',
                //     icon: Icons.stop,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CronometerButton(
                    label: 'Reset',
                    icon: Icons.refresh,
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
