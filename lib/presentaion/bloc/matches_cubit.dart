import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
      print('DioException in fetchTodayMatches: ${e.message}');
      emit(MatchesError(message: e.toString()));
    } catch (e) {
      print('Exception in fetchTodayMatches: ${e.toString()}');
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
      print('DioException in fetchUpcomingMatches: ${e.message}');
      emit(MatchesError(message: e.toString()));
    } catch (e) {
      print('Exception in fetchUpcomingMatches: ${e.toString()}');
      emit(MatchesError(message: e.toString()));
    }
  }

  Future<void> fetchPastMatches() async {
    emit(MatchesLoading());
    Dio dio = Dio();
    try {
      final response = await dio.get(
        ApiConstants.pastMatches,
        options: Options(
          headers: {'Authorization': 'Bearer 15819|rX7ELUR9o4zNtSfCvAygVYvhTeiPGGBn18gNXotU3d8b99d2'},
        ),
      );
      final matchModel = MatchModel.fromJson(response.data);
      emit(MatchesLoadedSuccessfuly(match: matchModel));
    } on DioException catch (e) {
      print('DioException in fetchPastMatches: ${e.message}');
      emit(MatchesError(message: e.toString()));
    } catch (e) {
      print('Exception in fetchPastMatches: ${e.toString()}');
      emit(MatchesError(message: e.toString()));
    }
  }
}
