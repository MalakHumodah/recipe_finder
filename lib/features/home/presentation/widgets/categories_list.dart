import 'category_card.dart';
import 'package:recipe_finder/features/home/presentation/presentation.export.dart';


class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: PaddingSizes.smallPadding / 2,
          horizontal: PaddingSizes.smallPadding,
        ),
        child: SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categoriesNames.length,
            itemBuilder: (context, index) {
              return CategoryCard(title: state.categoriesNames[index]);
            },
          ),
        ),
      );
    });
  }
}
