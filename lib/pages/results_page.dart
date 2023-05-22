import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/cards.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: const Text(
              'Your Result',
              style: titleTextStyle,
            ),
          ),
          Expanded(
            child: MyCard(
              onPress: () {},
              bgcolor: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    args.resultText,
                    style: resultTextStyle,
                  ),
                  Text(
                    args.bmiResult,
                    style: bmiTextStyle,
                  ),
                  Text(
                    args.interpretation,
                    textAlign: TextAlign.center,
                    style: bodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'RE - CALCULER'),
        ],
      ),
    );
  }
}
