import 'package:dio/dio.dart';
import 'package:tornet/core/network/api_constants.dart';
import 'package:tornet/core/network/dio_services.dart';
import 'package:tornet/data/models/match_model/match_model.dart';
import 'package:tornet/presentaion/bloc/matches_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchesCubit extends Cubit<MatchesState> {
  final _apiServices = DioServices(Dio());

  MatchesCubit() : super(MatchesInitial());

  Future<void> fetchTodayMatches() async {
    emit(MatchesLoading());
    try {
      final response = await _apiServices.get(ApiConstants.todayMatches);
      final matchModel = MatchModel.fromJson(response.data);
      emit(MatchesLoadedSuccessfuly(match: matchModel));
    } on DioException catch (e) {
      emit(MatchesError(message: e.toString()));
    } catch (e) {
      emit(MatchesError(message: e.toString()));
    }
  }

  Future<void> fetchUpcomingMatches() async {
    emit(MatchesLoading());
    try {
      final response = await _apiServices.get(ApiConstants.upcomingMatches);
      final matchModel = MatchModel.fromJson(response.data);
      emit(MatchesLoadedSuccessfuly(match: matchModel));
    } on DioException catch (e) {
      emit(MatchesError(message: e.toString()));
    } catch (e) {
      emit(MatchesError(message: e.toString()));
    }
  }

  Future<void> fetchPastMatches() async {
    emit(MatchesLoading());
    try {
      final response = await _apiServices.get(ApiConstants.pastMatches);
      final matchModel = MatchModel.fromJson(response.data);
      emit(MatchesLoadedSuccessfuly(match: matchModel));
    } on DioException catch (e) {
      emit(MatchesError(message: e.toString()));
    } catch (e) {
      emit(MatchesError(message: e.toString()));
    }
  }
}
