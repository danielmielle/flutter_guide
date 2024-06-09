import 'package:flutter/material.dart';

class Modules extends StatelessWidget {
  // final String moduleName;
  static const routeName = '/detail';
  const Modules({super.key});

  Widget buildContentWidget(String item) {
    Widget content;

    switch (item) {
      case 'Roll Dice':
        content = const Text('Roll Dice');
        break;
      default:
        content = const Text('Default content');
        break;
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    final String item = ModalRoute.of(context)!.settings.arguments as String;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: () {
          buildContentWidget(item);
        },
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(12)),
          child: Text(
            item,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
