import 'package:recipe_finder/features/home/presentation/presentation.export.dart';


class CategoryCard extends StatelessWidget {
  final String title;

  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: PaddingSizes.smallPadding,
        vertical: PaddingSizes.smallPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.all(
          Radius.circular(
            BorderRadiusSizes.largeRadius,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.mediumPadding,
          ),
          child: InkWell(
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/img.png',
                  height: IconSizes.mediumIcon,
                  color:Theme.of(context).primaryColor,
                ),
                 SizedBox(width: SpacesSizes.smallSpace,),
                 CustomText.subHeadText(txt: title),
              ],
            ),
            onTap: () {
              context.read<HomeBloc>().add(FilterByCategories(title));
            },
          ),
        ),
      ),
    );
  }
}
