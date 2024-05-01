import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:recipe_finder/core/constants/sizes.dart';
import 'package:recipe_finder/core/shared/widgets/custom_text_style.dart';
import 'package:recipe_finder/features/saved_recipes/presentation/widgets/saved_recipe_card.dart';
import '../../../home/domain/entity/meal_entity.dart';
import '../bloc/saved_recipes_bloc.dart';
import '../bloc/saved_recipes_event.dart';

class BuildSavedScreen extends StatelessWidget {
  final List<MealEntity> savedRecipes;

  const BuildSavedScreen({super.key, required this.savedRecipes});

  @override
  Widget build(BuildContext context) {
    if (savedRecipes.isNotEmpty) {
      return SafeArea(
        child: ListView.builder(
          itemCount: savedRecipes.length,
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane: ActionPane(
                motion: BehindMotion(),
                children: [
                  SlidableAction(
                    autoClose: true,
                    borderRadius: BorderRadius.all(Radius.circular(
                      BorderRadiusSizes.smallRadius,
                    )),
                    onPressed: (context) => _dialogBuilder(
                      context,
                      savedRecipes[index],
                    ),
                    icon: Icons.bookmark_remove,
                    backgroundColor: Theme.of(context).highlightColor,
                    foregroundColor: Theme.of(context).primaryColor,
                    label: 'unSave',
                  ),
                ],
              ),
              child: SavedRecipeCard(
                meal: savedRecipes[index],
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: CustomText.titleText(
          txt: 'You dosen\'t save any recipe',
        ),
      );
    }
  }

  Future<void> _dialogBuilder(
    BuildContext context,
    MealEntity mealEntity,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to unSave'),
          actions: <Widget>[
            TextButton(
              child: const Text('unSave'),
              onPressed: () {
                context.read<SavedRecipesBloc>().add(RemoveRecipe(mealEntity));
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
