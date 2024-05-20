import 'package:flutter/material.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/shared/widgets/custom_text_style.dart';
import '../../../../core/shared/widgets/saved_icon.dart';
import '../../../home/domain/entity/meal_entity.dart';

class RecipeDetails extends StatelessWidget {
  final MealEntity meal;

  const RecipeDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: PaddingSizes.mediumPadding,
          vertical: PaddingSizes.mediumPadding),
      children: [
        CustomText.titleText(
          txt: meal.strMeal,
          size: 40,
        ),
        const SizedBox(
          height: SpacesSizes.smallSpace,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.subHeadText(
              txt: '${meal.strCategory}, ${meal.strArea}',
              size: 20,
            ),
            SavedIcon(
              meal: meal,
              iconSizes: IconSizes.mediumIcon,
              radius: BorderRadiusSizes.mediumRadius,
            ),
          ],
        ),
        const SizedBox(
          height: SpacesSizes.smallSpace,
        ),
        for (int i = 0; i < meal.ingredientsMeasure.length; i++)
          CustomText.subHeadText(
            txt:
                '- ${meal.ingredientsMeasure[i].strMeasure} ${meal.ingredientsMeasure[i].strIngredients}',
          ),
        const SizedBox(
          height: SpacesSizes.smallSpace,
        ),
        CustomText.body1Text(
          txt: meal.strInstructions,
        ),
        SizedBox(
          height: SpacesSizes.mediumSpace,
        )
      ],
    );
  }
}
