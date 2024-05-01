abstract class HomeEvents {}

class SearchByName extends HomeEvents {}

class GetRecipeDetails extends HomeEvents {
  final String name;

  GetRecipeDetails(this.name);
}

class FilterByCategories extends HomeEvents {
  final String category;

  FilterByCategories(this.category);
}

class FilterByAreas extends HomeEvents {
  final String area;

  FilterByAreas(this.area);
}

class GetLocalData extends HomeEvents {}
