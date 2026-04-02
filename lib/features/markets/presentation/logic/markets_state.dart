part of 'markets_cubit.dart';

abstract class MarketsState extends Equatable {
  const MarketsState();

  @override
  List<Object> get props => [];
}

final class MarketsInitial extends MarketsState {}

final class MarketsLoading extends MarketsState {}

final class MarketsSuccess extends MarketsState {
  final List<Coin> allMarkets;

  const MarketsSuccess(this.allMarkets);

  @override
  List<Object> get props => [allMarkets];
}

final class MarketsError extends MarketsState {
  final String message;

  const MarketsError(this.message);

  @override
  List<Object> get props => [message];
}
