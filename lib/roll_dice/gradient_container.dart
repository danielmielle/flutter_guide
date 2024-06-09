import 'package:flutter/material.dart';
import 'package:flutter_guide/roll_dice/dice_roller.dart';
import 'package:flutter_guide/roll_dice/styled_text.dart';

const beginAlignment = Alignment.topCenter;
const endAlignment = Alignment.bottomCenter;

class GradientContainer extends StatelessWidget {
   const GradientContainer(this.color1, this.color2, {super.key});

   const GradientContainer.purple({super.key})
      : color1 = Colors.purple,
        color2 = Colors.deepPurple;

  final Color color1;
  final Color color2;



  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: beginAlignment,
          end: endAlignment,
          colors: [color1, color2],
          stops: const [0.3, 0.7],
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
