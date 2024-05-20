import 'package:recipe_finder/features/home/presentation/presentation.export.dart';

class RecipeCard extends StatelessWidget {
  final MealEntity meal;

  const RecipeCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.mediumPadding,
      ),
      child: InkWell(
        onTap: () async {
          context.read<HomeBloc>().add(GetRecipeDetails(meal.strMeal));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const RecipeDetailsView()));
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedImage(
                  imageUrl: '${meal.strMealThumb}/preview',
                  width: ImageSizes.largeImage,
                  radius: BorderRadiusSizes.mediumRadius,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: PaddingSizes.mediumPadding,
                    ),
                    child: CustomText.subHeadText(
                      txt: meal.strMeal,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 75,
              child: SavedIcon(meal: meal),
            ),
          ],
        ),
      ),
    );
  }
}
