import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_re_visited/models/stories_model.dart';
import 'package:bloc_re_visited/repository/repo.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepo repo;
  NewsBloc({this.repo}) : super(NewsInitial());


  // @override
  // NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if(event is FetchNews){
      yield NewsInitial();
      try {
        final List<Stories> storyrep = await repo.getNews();
        yield NewsSuccess(stories: storyrep);
      }
      catch(_){
        NewsFailure();
      }
    }
  }
}
