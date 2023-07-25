import 'dart:math';
import 'dart:ui';
import 'package:random_background_color/random_color_generator/random_color_generator.dart';

class RandomColorFromARGB extends RandomColorGenerator {
  final Random _random = Random();
  final int _mxValue = 256;
  @override
  Color getRandomColor() {
    return Color.fromARGB(
      _random.nextInt(_mxValue),
      _random.nextInt(_mxValue),
      _random.nextInt(_mxValue),
      _random.nextInt(_mxValue),
    );
  }
}
