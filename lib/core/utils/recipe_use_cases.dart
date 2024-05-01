abstract class RecipesUseCase<T, P> {
  // Future<T> getMealByName(MealByNameParameters parameters);
  Future<T> call(P parameters);
}
