part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}


// ---------------Category States---------------
final class GetCategoryLoadingState extends AppState {}

final class GetCategorySuccessState extends AppState {
  final CategoryModel categoryModel;

  GetCategorySuccessState(this.categoryModel);
}

final class GetCategoryErrorState extends AppState {
  final String error;

  GetCategoryErrorState(this.error);
}

 
