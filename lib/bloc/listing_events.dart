import 'package:news_app/models/category_model.dart';

abstract class ListingEvents {}

class CategoryListing extends ListingEvents {}

class FetchNewsEvent extends ListingEvents {}

class FetchCategoryNewsEvent extends ListingEvents {
  final category;
  FetchCategoryNewsEvent({required this.category});
}
