import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screens.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.pink),
      ),
      home: const HomeScreen(),
    );
  }
}
