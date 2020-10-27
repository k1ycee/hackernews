import 'package:bloc_re_visited/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewStories extends StatefulWidget {
  @override
  _NewStoriesState createState() => _NewStoriesState();
}

class _NewStoriesState extends State<NewStories> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsInitial) {
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
            ),
          );
        }
        if (state is NewsFailure) {
          return Center(
            child: Text("This is a total failing bruh"),
          );
        }
        if (state is NewsSuccess) {
          return ListView.builder(
            itemCount: state.props.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(state.props.length.toString()),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
          ),
        );
      },
    );
  }
}
