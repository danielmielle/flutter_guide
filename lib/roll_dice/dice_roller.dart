import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_guide/common/styled_text.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        // currentDiceRoll = randomizer.nextInt(6) + 1;
      });
    });
    super.initState();
  }

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            'assets/images/dice-$currentDiceRoll.png',
            width: 200,
            key: UniqueKey(),
          ),
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: rollDice,
          child:
              const StyledText("Roll Dice", 40, FontWeight.w500, Colors.white),
        )
      ],
    );
  }
}
