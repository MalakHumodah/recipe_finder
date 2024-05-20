import 'package:dartz/dartz.dart';

abstract class RecipesUseCase<T, P> {
  Future<Either<String, T>> call(P parameters);
}
