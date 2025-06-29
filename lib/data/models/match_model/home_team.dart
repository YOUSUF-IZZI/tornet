class HomeTeam {
  String? id;
  String? apiId;
  String? name;
  String? shortName;
  String? logo;
  List<int>? score;
  String? shirt;
  bool? isDefaultShirt;
  bool? national;

  HomeTeam({
    this.id,
    this.apiId,
    this.name,
    this.shortName,
    this.logo,
    this.score,
    this.shirt,
    this.isDefaultShirt,
    this.national,
  });

  factory HomeTeam.fromJson(Map<String, dynamic> json) => HomeTeam(
    id: json['id'] as String?,
    apiId: json['api_id'] as String?,
    name: json['name'] as String?,
    shortName: json['short_name'] as String?,
    logo: json['logo'] as String?,
    score: json['score'] as List<int>?,
    shirt: json['shirt'] as String?,
    isDefaultShirt: json['is_default_shirt'] as bool?,
    national: json['national'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'api_id': apiId,
    'name': name,
    'short_name': shortName,
    'logo': logo,
    'score': score,
    'shirt': shirt,
    'is_default_shirt': isDefaultShirt,
    'national': national,
  };

  HomeTeam copyWith({
    String? id,
    String? apiId,
    String? name,
    String? shortName,
    String? logo,
    List<int>? score,
    String? shirt,
    bool? isDefaultShirt,
    bool? national,
  }) {
    return HomeTeam(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      logo: logo ?? this.logo,
      score: score ?? this.score,
      shirt: shirt ?? this.shirt,
      isDefaultShirt: isDefaultShirt ?? this.isDefaultShirt,
      national: national ?? this.national,
    );
  }
}
