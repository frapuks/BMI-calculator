import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0e21),
        appBarTheme: const AppBarTheme(
          color: Color(0xff0a0e21),
        ),
      ),
      // home: const InputPage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const InputPage(),
        '/results': (context) => const ResultsPage(),
      },
    );
  }
}
