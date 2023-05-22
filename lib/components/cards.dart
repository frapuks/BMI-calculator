import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.bgcolor,
      required this.cardChild,
      required this.onPress});

  final Color bgcolor;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}
