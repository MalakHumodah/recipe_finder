import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/shared/widgets/cached_image_network.dart';
import '../../../../core/shared/widgets/custom_text_style.dart';
import '../../../home/domain/entity/meal_entity.dart';
import '../../../recipe_details/presentation/widgets/recipe_details_widget.dart';
import '../bloc/random_meal_bloc.dart';
import '../bloc/random_meal_event.dart';

class BuildRandomScreen extends StatelessWidget {
  final MealEntity meal;

  const BuildRandomScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedImage(
          imageUrl: meal.strMealThumb,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
        ),
        Positioned(
          right: SpacesSizes.smallSpace,
          child: SafeArea(
            child: ElevatedButton(
                onPressed: () {
                  context.read<RandomMealBloc>().add(GetRandomMeal());
                },
                child: CustomText.subHeadText(
                  txt: 'Generate',
                )),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(BorderRadiusSizes.mediumRadius),
                ),
              ),
              child: RecipeDetails(
                meal: meal,
              )),
        ),
      ],
    );
  }
}
