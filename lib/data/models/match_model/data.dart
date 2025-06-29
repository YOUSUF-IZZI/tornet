import 'competition.dart';
import 'match.dart';

class Data {
  Competition? competition;
  List<Match>? matches;

  Data({this.competition, this.matches});

  factory Data.fromJson(Map<String, dynamic> json) => Data(competition: json['competition'] == null ? null : Competition.fromJson(json['competition'] as Map<String, dynamic>), matches: (json['matches'] as List<dynamic>?)?.map((e) => Match.fromJson(e as Map<String, dynamic>)).toList());

  Map<String, dynamic> toJson() => {'competition': competition?.toJson(), 'matches': matches?.map((e) => e.toJson()).toList()};

  Data copyWith({Competition? competition, List<Match>? matches}) {
    return Data(competition: competition ?? this.competition, matches: matches ?? this.matches);
  }
}
