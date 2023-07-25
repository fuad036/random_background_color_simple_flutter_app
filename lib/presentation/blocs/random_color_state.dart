part of 'random_color_bloc.dart';


abstract class RandomColorState {}

class InitialColorState extends RandomColorState {}

class NewColorState extends RandomColorState {
  final Color color;
  NewColorState(this.color);
}
