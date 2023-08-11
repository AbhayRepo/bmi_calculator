import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class InsiderCard extends StatelessWidget {
  InsiderCard(this.icons,this.Gender, {super.key});

  final String Gender;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          Gender,
          style: labeltextstyle,
        )
      ],
    );
  }
}