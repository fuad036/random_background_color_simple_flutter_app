import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_background_color/random_color_generator/random_color_from_argb.dart';
import 'package:random_background_color/random_color_generator/random_color_generator.dart';

void main() {
  group('RandomColorFromARGB', () {
    test('getRandomColor returns a random Color', () {
      final RandomColorGenerator generator = RandomColorFromARGB();

      final Color color1 = generator.getRandomColor();
      final Color color2 = generator.getRandomColor();

      expect(color1, isNotNull);
      expect(color2, isNotNull);

      expect(color1, isNot(equals(color2)));
    });

    test('generated colors have valid ARGB values', () {
      final RandomColorGenerator generator = RandomColorFromARGB();

      final Color color = generator.getRandomColor();

      const int mxValue = 255;
      expect(color.alpha, inInclusiveRange(0, mxValue));
      expect(color.red, inInclusiveRange(0, mxValue));
      expect(color.green, inInclusiveRange(0, mxValue));
      expect(color.blue, inInclusiveRange(0, mxValue));
    });
  });
}
