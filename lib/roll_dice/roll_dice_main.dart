import 'package:flutter/material.dart';
import 'package:flutter_guide/roll_dice/gradient_container.dart';

class RollDice extends StatelessWidget {
  const RollDice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 137, 141, 24),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("RollDice"),
      ),
      body: const GradientContainer(Color(0xFF6DD5ED), Color(0xFF2193B0)),
    );
  }
}
