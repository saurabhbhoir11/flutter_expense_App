import 'package:expence_app/main.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    //used if we chenge theme based on system theme
    // final bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    // used to check whethet user has selected dark mode
    final bool isDarkMode = MyApp.themeNotifier.value == ThemeMode.dark;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              color:
                  isDarkMode
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary.withAlpha(180),
            ),
          ),
        ),
      ),
    );
  }
}
