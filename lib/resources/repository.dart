import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/user_model.dart';
import 'package:news_app/resources/authenticate_provider.dart';

import 'newsApiProvider.dart';

class NewsRepository {
  NewsApiProvider _newsApiProvider = NewsApiProvider();

  Future<List<ArticleModel>> fetchingNews() async => _newsApiProvider.getNews();
  Future<List<ArticleModel>> fetchingCategoryNews(String category) async => _newsApiProvider.getCategoryNews(category);
}
//Repo for auth
class AuthRepository {
  
  AuthencticateProvider _authRepository = AuthencticateProvider();
  Future<String> login(UserModel user) async => _authRepository.signIn(user);
  Future<String> register(UserModel user) async => _authRepository.registerUser(user);
  void signout() async => _authRepository.signout();
   Future<String> verify(String username, String otp) async => _authRepository.confirmSignUp( username,otp) ;
 //  void configureAmplify() async => _authRepository.configureAmplify();

}
