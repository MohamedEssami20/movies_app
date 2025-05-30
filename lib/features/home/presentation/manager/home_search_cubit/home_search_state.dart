part of 'home_search_cubit.dart';
enum HomeStateNow {
  normal,
  search,
}
@immutable
sealed class HomeSearchState {}

final class HomeSearchInitial extends HomeSearchState {}

final class HomeStateChanged extends HomeSearchState {
  final HomeStateNow mode;
  HomeStateChanged({required this.mode});
}
 
