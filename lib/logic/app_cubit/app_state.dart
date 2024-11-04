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

// ---------------Banners States---------------
final class GetbannerslodingState extends AppState {}

final class GetbannersSuccessState extends AppState {
  final BannersModel bannersModel;

  GetbannersSuccessState(this.bannersModel);
}

final class GetbannersErrorState extends AppState {
  final String error;

  GetbannersErrorState(this.error);
}

final class GetProductSuccessState extends AppState {
  final ProductsModel productModel;

  GetProductSuccessState(this.productModel);
}
final class GetProductErrorState extends AppState {
  final String error;

  GetProductErrorState(this.error);
}
final class GetProductLoadingState extends AppState {}
