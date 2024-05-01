import 'package:recipe_finder/features/home/presentation/presentation.export.dart';


class AreasFilter extends StatelessWidget {
  const AreasFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return PopupMenuButton(
        onSelected: (value) {
          context.read<HomeBloc>().add(FilterByAreas(value));
        },
        icon: Image.asset(
          'assets/icons/icons8-earth-100.png',
          width: IconSizes.mediumIcon,
        ),
        itemBuilder: (BuildContext context) {
          return state.areasNames
              .map(
                (area) => PopupMenuItem(
                  value: area,
                  child: Padding(
                    padding: const EdgeInsets.all(PaddingSizes.smallPadding),
                    child: CustomText.subHeadText(txt: area),
                  ),
                ),
              ).toList();
        },
      );
    });
  }
}
