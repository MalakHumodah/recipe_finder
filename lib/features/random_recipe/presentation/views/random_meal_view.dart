import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/features/random_recipe/presentation/bloc/random_meal_state.dart';
import '../../../../core/shared/widgets/circular_indicator.dart';
import '../bloc/random_meal_bloc.dart';
import '../widgets/build_random_screen.dart';

class RandomMealView extends StatelessWidget {
  const RandomMealView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomMealBloc, RandomMealState>(
        builder: (context, state) {
      if (state.randomPageStatus == RandomPageStatus.success) {
        return BuildRandomScreen(
          meal: state.mealEntity,
        );
      } else {
        return const CircularIndicator();
      }
    });
  }
}

