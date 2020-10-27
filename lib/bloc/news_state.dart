part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsFailure extends NewsState {}

class NewsSuccess extends NewsState{
  final List<Stories> stories;
  const NewsSuccess({this.stories});

  @override
  List<Object> get props => [stories];
}