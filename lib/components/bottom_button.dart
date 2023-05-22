import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Center(
          child: Text(
            title,
            style: largeButtonStyle,
          ),
        ),
      ),
    );
  }
}
