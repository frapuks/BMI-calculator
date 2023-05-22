import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/cards.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';

import '../components/bottom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender genderSelected = Gender.male;
  int height = 180;
  int weight = 80;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                height = 180;
                weight = 80;
                age = 25;
              });
            },
            child: const Text('Reset'),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    bgcolor: genderSelected == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'HOMME',
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    bgcolor: genderSelected == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMME',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              onPress: () {},
              bgcolor: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'TAILLE',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0xffeb1555),
                        inactiveTrackColor: Colors.white,
                        overlayColor: const Color(0x29eb1555),
                        activeTrackColor: const Color(0xffeb1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        // inactiveColor: const Color(0xff8d8e98),
                        onChanged: (double heightSelected) {
                          setState(() {
                            height = heightSelected.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    onPress: () {},
                    bgcolor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'POIDS',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn1",
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: const Color(0xffeb1555),
                              foregroundColor: Colors.white,
                              child: const Icon(FontAwesomeIcons.minus),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              heroTag: "btn2",
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: const Color(0xffeb1555),
                              foregroundColor: Colors.white,
                              child: const Icon(FontAwesomeIcons.plus),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    onPress: () {},
                    bgcolor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn3",
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: const Color(0xffeb1555),
                              foregroundColor: Colors.white,
                              child: const Icon(FontAwesomeIcons.minus),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              heroTag: "btn4",
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: const Color(0xffeb1555),
                              foregroundColor: Colors.white,
                              child: const Icon(FontAwesomeIcons.plus),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              String bmiResult = calc.calculateBMI();
              String resultText = calc.getResult();
              String interpretation = calc.getInterpretation();

              Navigator.pushNamed(
                context,
                '/results',
                arguments:
                    ScreenArguments(bmiResult, resultText, interpretation),
              );
            },
            title: 'CALCULER',
          ),
        ],
      ),
    );
  }
}

class ScreenArguments {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ScreenArguments(this.bmiResult, this.resultText, this.interpretation);
}
