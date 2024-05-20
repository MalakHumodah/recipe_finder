import 'dart:async';
import 'package:recipe_finder/features/home/domain/use_cases/get_meals_usecases.dart';
import 'package:recipe_finder/features/home/presentation/presentation.export.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  SearchController searchController = SearchController();
  final GetMealsUseCases getMealsUseCases;

  HomeBloc(
    this.getMealsUseCases,
  ) : super(const HomeState()) {
    on<SearchByName>(_searchByName);
    on<GetLocalData>(_getLocalData);
    on<FilterByCategories>(_filterByCategories);
    on<FilterByAreas>(_filterByAreas);
    on<GetRecipeDetails>(_getRecipeDetails);

    add(GetLocalData());
  }

  FutureOr<void> _getLocalData(
      GetLocalData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      homeStateStatus: HomeStateStatus.loading,
    ));
    var categoriesNames =
        await getMealsUseCases.getCategoriesListNamesUseCase();
    var areasNames = await getMealsUseCases.getAreasListNamesUseCase();
    emit(state.copyWith(
      homeStateStatus: HomeStateStatus.success,
      categoriesNames: categoriesNames,
      areasNames: areasNames,
    ));
  }

  FutureOr<void> _searchByName(
    SearchByName event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(homeStateStatus: HomeStateStatus.loading));

    // var meals = await getMealsUseCases
    //     .call(MealByNameParameters(name: searchController.text));

    final result = await getMealsUseCases
        .call(MealByNameParameters(name: searchController.text));
    result.fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l,
          homeStateStatus: HomeStateStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          meals: r.meals,
          homeStateStatus: HomeStateStatus.success,
        ),
      ),
    );
    // emit(state.copyWith(
    //   meals: meals.meals,
    //   homeStateStatus: HomeStateStatus.success,
    // ));
  }

  FutureOr<void> _filterByCategories(
      FilterByCategories event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      homeStateStatus: HomeStateStatus.loading,
    ));
    var mealsList = await getMealsUseCases.getMealsByCategoryUseCase(
        CategoryParameters(category: event.category));

    emit(state.copyWith(
      meals: mealsList.meals,
      homeStateStatus: HomeStateStatus.success,
    ));
  }

  FutureOr<void> _filterByAreas(
      FilterByAreas event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      homeStateStatus: HomeStateStatus.loading,
    ));
    var meals = await getMealsUseCases
        .getMealsByAreaUseCase(AreaParameters(area: event.area));

    // meals.addAll(await getMealsUseCases
    //     .getMealsByAreaUseCase(AreaParameters(area: event.area)));
    emit(state.copyWith(
      meals: meals.meals,
      homeStateStatus: HomeStateStatus.success,
    ));
  }

  FutureOr<void> _getRecipeDetails(
      GetRecipeDetails event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      homeStateStatus: HomeStateStatus.loading,
    ));

    final result = await getMealsUseCases
        .call(MealByNameParameters(name: searchController.text));
    result.fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l,
          homeStateStatus: HomeStateStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          mealEntity: r.meals.first,
          homeStateStatus: HomeStateStatus.success,
        ),
      ),
    );

    // var customMeal =
    //     await getMealsUseCases.call(MealByNameParameters(name: event.name));
    //
    // emit(state.copyWith(
    //   mealEntity: customMeal.meals.first,
    //   homeStateStatus: HomeStateStatus.success,
    // ));
  }
}
