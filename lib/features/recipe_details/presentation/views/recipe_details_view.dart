import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/features/home/presentation/bloc/home_bloc.dart';
import 'package:recipe_finder/features/home/presentation/bloc/home_state.dart';
import '../../../../core/shared/widgets/circular_indicator.dart';
import '../widgets/build_screen.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state.homeStateStatus == HomeStateStatus.success) {
        return BuildScreen(meal: state.mealEntity);
      } else {
        return const Scaffold(body: CircularIndicator());
      }
    });
  }
}
