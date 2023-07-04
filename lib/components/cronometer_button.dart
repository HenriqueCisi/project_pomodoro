import 'package:flutter/material.dart';

class CronometerButton extends StatelessWidget {
   CronometerButton({
    required this.label,
    required this.icon,
    required this.action,
    super.key,
  });

  final String label;
  final IconData icon;
  void Function()? action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        textStyle: const TextStyle(fontSize: 25),
      ),
      onPressed: action,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              size: 35,
            ),
          ),
          Text(label),
        ],
      ),
    );
  }
}
