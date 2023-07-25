import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_background_color/presentation/blocs/random_color_bloc.dart';
import 'package:random_background_color/random_color_generator/random_color_from_argb.dart';
import 'package:random_background_color/utils/utils.dart';


class RandomBackgroundColorScreen extends StatefulWidget {
  const RandomBackgroundColorScreen({super.key});

  @override
  State<RandomBackgroundColorScreen> createState() => _RandomBackgroundColorScreenState();
}

class _RandomBackgroundColorScreenState extends State<RandomBackgroundColorScreen> {
  RandomColorBloc? randomColorBloc;

  @override
  void initState() {
    randomColorBloc = RandomColorBloc(RandomColorFromARGB());
    super.initState();
  }

  Widget _buildColoredBody(Color bgColor) {
    return GestureDetector(
      onTap: () {
        randomColorBloc?.add(ChangeColor());
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body:  Center(
          child: Text(
            'Hello There',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Utils.textColorForBackground(bgColor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: randomColorBloc,
      builder: (context, state) {
        var backgroundColor = Colors.white;
        if (state is NewColorState) {
          backgroundColor = state.color;
        }

        return _buildColoredBody(backgroundColor);
      },
    );
  }

  @override
  void dispose() {
    randomColorBloc?.close();
    super.dispose();
  }
}
