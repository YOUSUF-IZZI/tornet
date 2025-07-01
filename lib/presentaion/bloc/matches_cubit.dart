import 'package:dio/dio.dart';
import 'package:tornet/core/network/api_constants.dart';
import 'package:tornet/core/network/dio_services.dart';
import 'package:tornet/data/models/match_model/match_model.dart';
import 'package:tornet/presentaion/bloc/matches_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:tornet/core/network/websocket_service.dart';


class MatchesCubit extends Cubit<MatchesState> {
  final _apiServices = DioServices(Dio());
  final WebSocketService _webSocketService = WebSocketService();
  StreamSubscription? _webSocketSubscription;

  MatchesCubit() : super(MatchesInitial()) {
    _initWebSocket();
  }

  void _initWebSocket() {
    _webSocketService.connect();
    // Listen for score updates
    _webSocketSubscription = _webSocketService.scoreEventStream.listen(_handleScoreUpdate);
  }

  void _handleScoreUpdate(Map<String, dynamic> scoreInfo) {
    // Only update if we're in a loaded state with match data
    if (state is MatchesLoadedSuccessfuly) {
      final currentState = state as MatchesLoadedSuccessfuly;
      final MatchModel currentMatches = currentState.match;
      // Create a new match model with updated scores
      final updatedMatches = _updateMatchScores(currentMatches, scoreInfo);
      // Emit new state with updated matches
      emit(MatchesLoadedSuccessfuly(match: updatedMatches));
    }
  }

  MatchModel _updateMatchScores(MatchModel currentMatches, Map<String, dynamic> scoreInfo) {
    // Extract data from score info
    final String matchId = scoreInfo['matchId'];
    final int matchStatus = scoreInfo['matchStatus'];
    final List<dynamic> homeTeamData = scoreInfo['homeTeamData'];
    final List<dynamic> awayTeamData = scoreInfo['awayTeamData'];
    
    // Create a deep copy of the current matches
    final MatchModel updatedMatches = MatchModel.fromJson(currentMatches.toJson());
    // Update each match group
    for (var i = 0; i < updatedMatches.data!.length; i++) {
      final matchGroup = updatedMatches.data![i];
      // Find and update the specific match
      for (var j = 0; j < matchGroup.matches!.length; j++) {
        final match = matchGroup.matches![j];
        // Check if this is the match we need to update
        if (match.apiId == matchId) {
          // Update match status
          match.matchStatusId = matchStatus;
          // Update match status description based on the status code
          match.matchStatusDescription = _getStatusDescription(matchStatus);
          // Update home team score
          if (match.homeTeam != null) {
            match.homeTeam!.score = List<dynamic>.from(homeTeamData);
          }
          // Update away team score
          if (match.awayTeam != null) {
            match.awayTeam!.score = List<dynamic>.from(awayTeamData);
          }
          break;
        }
      }
    }
    return updatedMatches;
  }
  
  String _getStatusDescription(int statusCode) {
    switch (statusCode) {
      case 0: return 'Abnormal';
      case 1: return 'Not started';
      case 2: return 'First half';
      case 3: return 'Half-time';
      case 4: return 'Second half';
      case 5: return 'Overtime';
      case 6: return 'Overtime';
      case 7: return 'Penalty Shoot-out';
      case 8: return 'End';
      case 9: return 'Delay';
      case 10: return 'Interrupt';
      case 11: return 'Cut in half';
      case 12: return 'Cancel';
      case 13: return 'To be determined';
      default: return 'Unknown';
    }
  }

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
  
  @override
  Future<void> close() {
    // Clean up WebSocket resources
    _webSocketSubscription?.cancel();
    _webSocketService.dispose();
    return super.close();
  }
}


//* Old code [before integrate with WebSocket]
// class MatchesCubit extends Cubit<MatchesState> {
//   final _apiServices = DioServices(Dio());

//   MatchesCubit() : super(MatchesInitial());

//   Future<void> fetchTodayMatches() async {
//     emit(MatchesLoading());
//     try {
//       final response = await _apiServices.get(ApiConstants.todayMatches);
//       final matchModel = MatchModel.fromJson(response.data);
//       emit(MatchesLoadedSuccessfuly(match: matchModel));
//     } on DioException catch (e) {
//       emit(MatchesError(message: e.toString()));
//     } catch (e) {
//       emit(MatchesError(message: e.toString()));
//     }
//   }

//   Future<void> fetchUpcomingMatches() async {
//     emit(MatchesLoading());
//     try {
//       final response = await _apiServices.get(ApiConstants.upcomingMatches);
//       final matchModel = MatchModel.fromJson(response.data);
//       emit(MatchesLoadedSuccessfuly(match: matchModel));
//     } on DioException catch (e) {
//       emit(MatchesError(message: e.toString()));
//     } catch (e) {
//       emit(MatchesError(message: e.toString()));
//     }
//   }

//   Future<void> fetchPastMatches() async {
//     emit(MatchesLoading());
//     try {
//       final response = await _apiServices.get(ApiConstants.pastMatches);
//       final matchModel = MatchModel.fromJson(response.data);
//       emit(MatchesLoadedSuccessfuly(match: matchModel));
//     } on DioException catch (e) {
//       emit(MatchesError(message: e.toString()));
//     } catch (e) {
//       emit(MatchesError(message: e.toString()));
//     }
//   }
// }
