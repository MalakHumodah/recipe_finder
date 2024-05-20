import 'package:flutter/material.dart';
import 'package:recipe_finder/features/recipe_details/presentation/widgets/recipe_details_widget.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/shared/widgets/cached_image_network.dart';
import '../../../home/domain/entity/meal_entity.dart';

class BuildScreen extends StatelessWidget {
  final MealEntity meal;

  const BuildScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedImage(
            imageUrl: meal.strMealThumb,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          SafeArea(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: IconSizes.mediumIcon,
                )),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: RecipeDetails(
                  meal: meal,
                )),
          ),
        ],
      ),
    );
  }
}
