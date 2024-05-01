import 'package:recipe_finder/features/home/presentation/presentation.export.dart';


class SearchBarView extends StatelessWidget {
  const SearchBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onSubmitted: (text) {
          context.read<HomeBloc>().add(SearchByName());
        },
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          fillColor: Colors.white,
          focusColor: Colors.white,
          filled: true,
          hintText: 'Search',
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
        controller: context.read<HomeBloc>().searchController,
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(BorderRadiusSizes.largeRadius),
    ),
  );
}
