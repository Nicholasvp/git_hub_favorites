// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Repo {
  String name;
  String description;
  String language;
  int stargazers_count;
  int forks_count;

  Repo({
    required this.name,
    required this.description,
    required this.language,
    required this.stargazers_count,
    required this.forks_count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'language': language,
      'stargazers_count': stargazers_count,
      'forks_count': forks_count,
    };
  }

  factory Repo.fromMap(Map<String, dynamic> map) {
    return Repo(
      name: map['name'] as String,
      description: map['description'] ?? '',
      language: map['language'] ?? 'none',
      stargazers_count: map['stargazers_count'] as int,
      forks_count: map['forks_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Repo.fromJson(String source) =>
      Repo.fromMap(json.decode(source) as Map<String, dynamic>);

  Repo copyWith({
    String? name,
    String? description,
    String? language,
    int? stargazers_count,
    int? forks_count,
  }) {
    return Repo(
      name: name ?? this.name,
      description: description ?? this.description,
      language: language ?? this.language,
      stargazers_count: stargazers_count ?? this.stargazers_count,
      forks_count: forks_count ?? this.forks_count,
    );
  }
}
