import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_background_color/presentation/blocs/random_color_bloc.dart';
import 'package:random_background_color/random_color_generator/random_color_generator.dart';

class MockRandomColorGenerator extends Mock implements RandomColorGenerator {}

void main() {
  group('RandomColorBloc', () {
    final mockRandomColorGenerator = MockRandomColorGenerator();

    test('initial state should be InitialColorState', () {
      final bloc = RandomColorBloc(mockRandomColorGenerator);
      expect(bloc.state, isA<InitialColorState>());
      bloc.close();
    });

    blocTest<RandomColorBloc, RandomColorState>(
      'emits NewColorState with a random color when ChangeColor event is added',
      build: () => RandomColorBloc(mockRandomColorGenerator),
      setUp: () {
        when(() => mockRandomColorGenerator.getRandomColor()).thenReturn(Colors.white);
      },
      act: (bloc) {
        bloc.add(ChangeColor());
      },
      expect: () => [isA<NewColorState>()],
      verify: (bloc) {
        verify(() => mockRandomColorGenerator.getRandomColor()).called(1);
        expect(bloc.state, isA<NewColorState>());
        final state = bloc.state as NewColorState;
        expect(state.color, isA<Color>());
      },
    );
  });
}
