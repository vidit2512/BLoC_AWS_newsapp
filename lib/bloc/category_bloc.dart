import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/category_event.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/category_model.dart';

import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(InitialCategory());
  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    try {
      // if (event is LoadCategory) {
      //   yield LoadedCategory();
      // }
      if (event is LoadCategory) {
        List<CategoryModel> categories = getCategories();

        yield (LoadedCategory(categories: categories));
      }
    } catch (e) {
      yield ErrorState();
    }
    //throw UnimplementedError();
  }
}
