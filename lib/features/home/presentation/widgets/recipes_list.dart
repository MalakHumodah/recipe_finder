import 'package:recipe_finder/features/home/presentation/presentation.export.dart';


class RecipesList extends StatelessWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state.homeStateStatus == HomeStateStatus.success) {
        return ShowRecipesList(meals: state.meals);
      } else {
        return LinearProgressIndicator();
      }
    });
  }
}

class ShowRecipesList extends StatelessWidget {
  final List<MealEntity> meals;

  const ShowRecipesList({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: meals.isNotEmpty,
        replacement: Center(
          child: CustomText.titleText(
            txt: 'Search your favourite meal recipe',
            textAlign: TextAlign.center,
            color: Theme.of(context).primaryColor
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.symmetric(
            vertical: PaddingSizes.smallPadding,
            horizontal: PaddingSizes.smallPadding,
          ),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return RecipeCard(
              meal: meals[index],
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.15,
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
