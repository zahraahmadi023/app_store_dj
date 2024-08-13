import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  final Function function;
  final Icon icon;

  AppBarIcons({required this.function, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor, shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: icon,
          ),
        ),
      ),
    );
  }
}
