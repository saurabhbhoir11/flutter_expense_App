import "package:expence_app/expenses_app/screens/expenses_screen.dart";
import 'package:flutter/services.dart';
import "package:flutter/material.dart";

bool isDarkTheme = false;

void changeColorScheme() {}

ColorScheme kColorScheme = ColorScheme.fromSeed(seedColor: Colors.purple);

ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 94, 0, 132),
);

void main() {
  // // for locking the device orientation
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   fn,
  // ) {
  //   runApp(const MyApp());
  // });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
    ThemeMode.light,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: kDarkColorScheme,
            appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kDarkColorScheme.onPrimaryContainer,
              foregroundColor: kDarkColorScheme.primaryContainer,
            ),
            cardTheme: CardTheme().copyWith(
              color: kDarkColorScheme.secondaryContainer,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              elevation: 10,
              shadowColor: kDarkColorScheme.shadow,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorScheme.primaryContainer,
                foregroundColor: kDarkColorScheme.onPrimaryContainer,
              ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.w600,
                color: kDarkColorScheme.primary,
                fontSize: 20,
              ),
              titleSmall: TextStyle(
                fontWeight: FontWeight.w700,
                color: kDarkColorScheme.onPrimaryContainer,
                fontSize: 15,
              ),
              bodyMedium: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: kDarkColorScheme.primary,
              ),
              bodyLarge: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: kDarkColorScheme.primaryFixed,
              ),
            ),
          ),
          theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer,
            ),
            cardTheme: CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              elevation: 10,
              shadowColor: kColorScheme.shadow,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer,
              ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.w600,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 20,
              ),
              titleSmall: TextStyle(
                fontWeight: FontWeight.w700,
                color: kColorScheme.onPrimaryContainer,
                fontSize: 15,
              ),
            ),
          ),
          themeMode: themeNotifier.value,
          home: const ExpensesScreen(),
        );
      },
    );
  }
}
