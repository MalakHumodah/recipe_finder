import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/injection/inj.dart';
import 'package:recipe_finder/features/home/presentation/bloc/home_bloc.dart';
import 'package:recipe_finder/features/nav_bar/presentation/views/nav_bar_view.dart';
import 'package:recipe_finder/features/saved_recipes/presentation/bloc/saved_recipes_bloc.dart';
import 'features/nav_bar/presentation/bloc/nav_bar_bloc.dart';
import 'features/random_recipe/presentation/bloc/random_meal_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBarBloc>(
            create: (context) => NavigationBarBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc(getIt())),
        BlocProvider<RandomMealBloc>(
            create: (context) => RandomMealBloc(getIt())),
        BlocProvider<SavedRecipesBloc>(create: (context) => SavedRecipesBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          hoverColor: Colors.blueGrey.shade200,
          colorSchemeSeed: Colors.blueGrey,
          primaryColorLight: Colors.blueGrey.shade50,
          useMaterial3: true,
        ),
        home: NavigationBarView(),
      ),
    );
  }
}
