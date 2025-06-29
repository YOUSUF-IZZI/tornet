class Competition {
  String? id;
  String? apiId;
  String? name;
  String? logo;

  Competition({this.id, this.apiId, this.name, this.logo});

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
    id: json['id'] as String?,
    apiId: json['api_id'] as String?,
    name: json['name'] as String?,
    logo: json['logo'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'api_id': apiId,
    'name': name,
    'logo': logo,
  };

  Competition copyWith({
    String? id,
    String? apiId,
    String? name,
    String? logo,
  }) {
    return Competition(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }
}
