import 'package:flutter/material.dart';
import 'package:random_background_color/presentation/screens/random_background_color_screen.dart';


class RandomBgColorApp extends StatelessWidget {
  const RandomBgColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Random Background Color app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomBackgroundColorScreen(),
    );
  }
}
