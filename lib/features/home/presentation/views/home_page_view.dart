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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).hoverColor,
        toolbarHeight: MediaQuery.of(context).size.height /5.5,
        flexibleSpace: SafeArea(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: PaddingSizes.largePadding),
                child: Row(
                  children: [
                    SearchBarView(),
                    AreasFilter(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: PaddingSizes.smallPadding),
                child: CategoriesList(),
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          RecipesList(),
        ],
      ),
    );
  }
}
