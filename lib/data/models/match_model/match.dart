import 'away_team.dart';
import 'home_team.dart';

class SingleMatch {
  String? id;
  String? apiId;
  HomeTeam? homeTeam;
  AwayTeam? awayTeam;
  int? matchStatusId;
  String? matchStatusDescription;
  String? matchDay;
  String? matchTime;
  int? kickOff;
  int? mustDisplay;
  int? published;

  SingleMatch({this.id, this.apiId, this.homeTeam, this.awayTeam, this.matchStatusId, this.matchStatusDescription, this.matchDay, this.matchTime, this.kickOff, this.mustDisplay, this.published});

  factory SingleMatch.fromJson(Map<String, dynamic> json) => SingleMatch(
    id: json['id'] as String?,
    apiId: json['api_id'] as String?,
    homeTeam: json['home_team'] == null ? null : HomeTeam.fromJson(json['home_team'] as Map<String, dynamic>),
    awayTeam: json['away_team'] == null ? null : AwayTeam.fromJson(json['away_team'] as Map<String, dynamic>),
    matchStatusId: json['match_status_id'] as int?,
    matchStatusDescription: json['match_status_description'] as String?,
    matchDay: json['match_day'] as String?,
    matchTime: json['match_time'] as String?,
    kickOff: json['kick_off'] as int?,
    mustDisplay: json['must_display'] as int?,
    published: json['published'] as int?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'api_id': apiId, 'home_team': homeTeam?.toJson(), 'away_team': awayTeam?.toJson(), 'match_status_id': matchStatusId, 'match_status_description': matchStatusDescription, 'match_day': matchDay, 'match_time': matchTime, 'kick_off': kickOff, 'must_display': mustDisplay, 'published': published};

  SingleMatch copyWith({String? id, String? apiId, HomeTeam? homeTeam, AwayTeam? awayTeam, int? matchStatusId, String? matchStatusDescription, String? matchDay, String? matchTime, int? kickOff, int? mustDisplay, int? published}) {
    return SingleMatch(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      matchStatusId: matchStatusId ?? this.matchStatusId,
      matchStatusDescription: matchStatusDescription ?? this.matchStatusDescription,
      matchDay: matchDay ?? this.matchDay,
      matchTime: matchTime ?? this.matchTime,
      kickOff: kickOff ?? this.kickOff,
      mustDisplay: mustDisplay ?? this.mustDisplay,
      published: published ?? this.published,
    );
  }
}
