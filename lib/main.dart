import 'package:bloc_re_visited/bloc/news_bloc.dart';
import 'package:bloc_re_visited/repository/repo.dart';
import 'package:bloc_re_visited/views/new_stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

NewsRepo _newsRepo = NewsRepo();
void main() {
  runApp(
    MyApp(
      newsRepo: _newsRepo,
    ),
  );
}

class MyApp extends StatelessWidget {
  final NewsRepo newsRepo;
  MyApp({this.newsRepo});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NewsBloc(repo: _newsRepo)..add(FetchNews()),
        child: Scaffold(
          body: NewStories(),
        ),
      ),
    );
  }
}
