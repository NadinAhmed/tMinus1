part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Coin> recentCoins;
  final List<Coin> topCoins;

  const HomeSuccess({required this.recentCoins, required this.topCoins});

  @override
  List<Object> get props => [recentCoins, topCoins];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
