import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:random_background_color/random_color_generator/random_color_generator.dart';

part 'random_color_event.dart';
part 'random_color_state.dart';

class RandomColorBloc extends Bloc<RandomColorEvent, RandomColorState> {
  RandomColorGenerator randomColorGenerator;
  RandomColorBloc(this.randomColorGenerator) : super(InitialColorState()) {
    _registerEvents();
  }

  void _registerEvents() {
    on<ChangeColor>((event, emit) async => emit(await _getRandomColor()));
  }

  Future<RandomColorState> _getRandomColor() async {
    final color = randomColorGenerator.getRandomColor();

    return NewColorState(color);
  }
}
