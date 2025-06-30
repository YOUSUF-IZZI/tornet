import 'package:equatable/equatable.dart';
import 'package:tornet/data/models/match_model/match_model.dart';

abstract class MatchesState extends Equatable {
  const MatchesState();

  @override
  List<Object?> get props => [];
}

class MatchesInitial extends MatchesState {}

class MatchesLoading extends MatchesState {}

class MatchesLoadedSuccessfuly extends MatchesState {
  final MatchModel match;

  const MatchesLoadedSuccessfuly({required this.match});

  @override
  List<Object?> get props => [match];
}

class MatchesError extends MatchesState {
  final String message;

  const MatchesError({required this.message});

  @override
  List<Object?> get props => [message];
}
