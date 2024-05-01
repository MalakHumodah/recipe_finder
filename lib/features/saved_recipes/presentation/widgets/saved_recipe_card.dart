import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/shared/widgets/cached_image_network.dart';
import '../../../../core/shared/widgets/custom_text_style.dart';
import '../../../home/domain/entity/meal_entity.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/bloc/home_event.dart';
import '../../../recipe_details/presentation/views/recipe_details_view.dart';

class SavedRecipeCard extends StatelessWidget {
  final MealEntity meal;

  const SavedRecipeCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.mediumPadding,
        vertical: PaddingSizes.mediumPadding / 2,
      ),
      child: InkWell(
        onTap: () async {
          context.read<HomeBloc>().add(GetRecipeDetails(meal.strMeal));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RecipeDetailsView()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.all(
              Radius.circular(BorderRadiusSizes.smallRadius),
            ),
          ),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedImage(
                    imageUrl: meal.strMealThumb,
                    width: ImageSizes.mediumImage,
                    height: ImageSizes.mediumImage,
                    radius: BorderRadiusSizes.smallRadius,
                  ),
                  const SizedBox(
                    width: SpacesSizes.smallSpace,
                  ),
                  Flexible(
                    child: CustomText.subHeadText(
                      txt: meal.strMeal,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
