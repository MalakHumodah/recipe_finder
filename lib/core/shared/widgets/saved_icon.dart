import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/features/home/domain/entity/meal_entity.dart';

import '../../../features/saved_recipes/presentation/bloc/saved_recipes_bloc.dart';
import '../../../features/saved_recipes/presentation/bloc/saved_recipes_event.dart';
import '../../../features/saved_recipes/presentation/bloc/saved_recipes_state.dart';
import '../../constants/sizes.dart';

class SavedIcon extends StatelessWidget {
  final MealEntity meal;
  final double? iconSizes;
  final double? radius;

  const SavedIcon({
    super.key,
    required this.meal,
    this.iconSizes,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedRecipesBloc, SavedRecipesState>(builder: (context, state) {
      bool isSaved = false;
      for (var item in state.savedRecipes) {
        if (item.idMeal == meal.idMeal) {
          isSaved = true;
          break;
        }
      }
      return isSaved
          ? CircleAvatar(
              backgroundColor: Colors.white70,
              radius: radius,
              child: IconButton(
                onPressed: () {
                  context.read<SavedRecipesBloc>().add(RemoveRecipe(meal));
                },
                icon: Icon(
                  Icons.bookmark_outlined,
                  size: iconSizes ?? IconSizes.smallIcon,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          : CircleAvatar(
              backgroundColor: Colors.white70,
              radius: radius,
              child: IconButton(
                onPressed: () {
                  context.read<SavedRecipesBloc>().add(SaveRecipe(meal));
                },
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  size: iconSizes ?? IconSizes.smallIcon,
                ),
              ),
            );
    });
  }
}
