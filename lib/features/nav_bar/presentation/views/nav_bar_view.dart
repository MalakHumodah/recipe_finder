import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/features/home/presentation/views/home_page_view.dart';
import 'package:recipe_finder/features/nav_bar/presentation/bloc/nav_bar_state.dart';

import '../../../random_recipe/presentation/views/random_meal_view.dart';
import '../../../saved_recipes/presentation/views/saved_screen.dart';
import '../bloc/nav_bar_bloc.dart';
import '../bloc/nav_bar_event.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
        builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: state.selectedPage,
          onDestinationSelected: (int index) {
            context.read<NavigationBarBloc>().add(ChangeScreen(index: index));
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.bookmark), label: 'Saved'),
            NavigationDestination(
              label: 'Random',
              icon: ImageIcon(AssetImage('assets/icons/icons8-random-64.png')),
            ),
          ],
        ),
        body: [
          const HomeView(),
          const SavedScreen(),
          const RandomMealView(),
        ][state.selectedPage],
      );
    });
  }
}
