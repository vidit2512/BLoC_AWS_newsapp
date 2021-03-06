import 'package:news_app/bloc/listing_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/resources/newsApiProvider.dart';
import 'package:news_app/resources/repository.dart';

import 'listing_states.dart';

class ListingBloc extends Bloc<ListingEvents, ListingStates> {
  final NewsRepository newsRepository;
  ListingBloc({required this.newsRepository})
      : //assert(newsRepository != null),
        super(InitialState());

  @override
  Stream<ListingStates> mapEventToState(ListingEvents event) async* {
    print(event);
    print('???');
    List<ArticleModel> articles, safearticles=[];
    try {
      // if (event is CategoryListing) {
      //   List<CategoryModel> categories = getCategories();

      //   yield (LoadingList(categories: categories));
      // } else

      if (event is FetchNewsEvent) {
        articles = await newsRepository.fetchingNews();
        print('heyyyyy');
       
       if(articles.length!=0)
        yield FetchedNews(articles: articles);
        else yield ZeroResults();
        //  yield (FetchedNews(articles: News.getNews()));
      }
      if(event is FetchCategoryNewsEvent)
      {
         articles = await newsRepository.fetchingCategoryNews(event.category);
        print('heyyyyy');
         if(articles.length!=0)
        yield FetchedNews(articles: articles);
        else yield ZeroResults();
       
      }
    } catch (e) {
      print(e.toString());
      yield FetchErrorState();
    }
    //  throw UnimplementedError();
  }
}
