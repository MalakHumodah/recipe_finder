import 'package:recipe_finder/features/home/presentation/presentation.export.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return _BuildHome();
  }
}

class _BuildHome extends StatelessWidget {
  const _BuildHome();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Theme.of(context).hoverColor,
          height: MediaQuery.of(context).size.height / 4.1,
          width: double.infinity,
          child: SafeArea(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: PaddingSizes.largePadding),
                  child: Row(
                    children: [
                      SearchBarView(),
                      AreasFilter(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: PaddingSizes.smallPadding),
                  child: CategoriesList(),
                )
              ],
            ),
          ),
        ),
        RecipesList(),
      ],
    );
  }
}
