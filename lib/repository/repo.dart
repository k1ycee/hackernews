import 'package:bloc_re_visited/api/hacker_news.dart';
import 'package:bloc_re_visited/models/stories_model.dart';

class NewsRepo{
  NewsAPI _api = NewsAPI();

  Future<List<Stories>> getNews() => _api.getNews();
}