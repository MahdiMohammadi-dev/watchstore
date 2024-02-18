part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeModel homeModel;

  const HomeSuccess({required this.homeModel});
}

class HomeError extends HomeState {
  final AppException appException;

  const HomeError({required this.appException});

  @override
  List<Object> get props => [appException];
}
