import 'dart:convert';

import 'package:bloc_re_visited/models/stories_model.dart';
import 'package:http/http.dart' as http;

class NewsAPI {
  String baseurl = "https://hacker-news.firebaseio.com/v0";

// Get the initial raw Json which is a list of Ids and return it as a list
  Future<List> newRaw() async {
    String url = "$baseurl/topstories.json";
    var getraw = await http.get(url);
    if (getraw.statusCode == 200) {
      final Iterable ids = jsonDecode(getraw.body);
      return ids.map((e) => e).toList();
    }
    return null;
  }

  /// Iterate through the list returned by newRaw()
  /// Make a new API call and deserialize the actual news data

  Future<Stories> getNews() async {
    var id = await newRaw();
    for (int i = 0; i <= 240; i++) {
      var needed = id[i];
      var getNews = await http.get("$baseurl/item/$needed.json");
      if (getNews.statusCode == 200 && i == 5) {
        return Stories.fromJson(jsonDecode(getNews.body));
      }
    }
    return null;
  }
}
