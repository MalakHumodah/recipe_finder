class IngredientsMeasureModel {
  final String? strIngredients;
  final String? strMeasure;

  IngredientsMeasureModel({
    this.strIngredients,
    this.strMeasure,
  });

  factory IngredientsMeasureModel.fromResponse(Map<String, dynamic> json) {
    return IngredientsMeasureModel(
      strIngredients: json['strIngredients'],
      strMeasure: json['strMeasure'],
    );
  }

  Map<String, dynamic> toJson() => {
        'strIngredients': strIngredients,
        'strMeasure': strMeasure,
      };
}
