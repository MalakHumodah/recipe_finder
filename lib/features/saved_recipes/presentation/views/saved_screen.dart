import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/shared/widgets/custom_text_style.dart';
import 'package:recipe_finder/features/saved_recipes/presentation/bloc/saved_recipes_bloc.dart';
import 'package:recipe_finder/features/saved_recipes/presentation/bloc/saved_recipes_state.dart';

import '../../../../core/shared/widgets/circular_indicator.dart';
import '../widgets/build_saved_screen.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedRecipesBloc, SavedRecipesState>(builder: (context, state) {
      if (state.savedScreenStatus == SavedScreenStatus.success) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).hoverColor,
            title: CustomText.titleText(
              txt: 'Saved Recipes',
              size: 25,
              color: Colors.black54,
            ),
          ),
          body: BuildSavedScreen(
            savedRecipes: state.savedRecipes.reversed.toList(),
          ),
        );
      } else {
        return const CircularIndicator();
      }
    });
  }
}
