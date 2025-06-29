import 'data.dart';

class MatchModel {
  List<Data>? data;

  MatchModel({this.data});

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(data: (json['data'] as List<dynamic>?)?.map((e) => Data.fromJson(e as Map<String, dynamic>)).toList());

  Map<String, dynamic> toJson() => {'data': data?.map((e) => e.toJson()).toList()};

  MatchModel copyWith({List<Data>? data}) {
    return MatchModel(data: data ?? this.data);
  }
}
