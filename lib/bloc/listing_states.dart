import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';

abstract class ListingStates {
  const ListingStates();
}

class InitialState extends ListingStates {
  const InitialState();
}

class LoadingList extends ListingStates {
  final List<CategoryModel> categories;
  const LoadingList({required this.categories});
}

class FetchedNews extends ListingStates {
  final List<ArticleModel> articles;
  const FetchedNews({required this.articles});
}
class ErrorState extends ListingStates{}
