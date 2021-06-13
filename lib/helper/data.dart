import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];

  String imageurl =
      'https://smeloans.co.uk/assets/media-library/images/hero-test-3-1000.jpg';
  String category = 'Business';

  CategoryModel categorymodel1 =
      new CategoryModel(imageurl: imageurl, category: category);

  imageurl =
      'https://smeloans.co.uk/assets/media-library/images/hero-test-3-1000.jpg';
  category = 'Tech';

  CategoryModel categorymodel2 =
      new CategoryModel(imageurl: imageurl, category: category);
      
  imageurl =
      'https://smeloans.co.uk/assets/media-library/images/hero-test-3-1000.jpg';
  category = 'Tech';

  CategoryModel categorymodel3 =
      new CategoryModel(imageurl: imageurl, category: category);
      
  imageurl =
      'https://smeloans.co.uk/assets/media-library/images/hero-test-3-1000.jpg';
  category = 'Tech';

  CategoryModel categorymodel4 =
      new CategoryModel(imageurl: imageurl, category: category);

  categories.add(categorymodel1);
  categories.add(categorymodel2);
   categories.add(categorymodel3);
  categories.add(categorymodel4);

  return categories;
}
