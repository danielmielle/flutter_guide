import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guide/roll_dice/roll_dice_main.dart';
import 'package:flutter_guide/routes/module_tiles.dart';

void main() {
  runApp(const MyApp());
}

// With Flutter, you create user interfaces by combining "widgets"
// You'll learn all about them (and much more) throughout this course!
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> items = [
    'Roll Dice',
  ];

  // Every custom widget must have a build() method
  @override
  Widget build(BuildContext context) {
    // Below, a bunch of built-in widgets are used (provided by Flutter)
    // They will be explained in the next sections
    // In this course, you will, of course, not just use them a lot but
    // also learn about many other widgets!
    return MaterialApp(
      title: 'Flutter First App',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        Modules.routeName: (context) => const Modules(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final String item = items[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  navigateToModulePage(context, item);
                },
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void navigateToModulePage(BuildContext context, String item) {
  if (item == 'Roll Dice') {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const RollDice()),
    );
  } else {
    Navigator.pushNamed(context, Modules.routeName, arguments: item);
  }
}
