import 'package:news_app/models/category_model.dart';

abstract class CategoryState {}

class InitialCategory extends CategoryState {}

class LoadedCategory extends CategoryState {
  List<CategoryModel> categories;
  LoadedCategory({required this.categories});
}

class ErrorState extends CategoryState {}
