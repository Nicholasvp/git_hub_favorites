// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:teste_vaga_dunnas/models/repo.dart';

class User {
  String login;
  String name;
  String? bio;
  int public_repos;
  String avatar_url;
  List<Repo> listRepo;
  List<Repo> listStarred;

  User({
    required this.login,
    required this.name,
    this.bio,
    required this.public_repos,
    required this.avatar_url,
    required this.listRepo,
    required this.listStarred,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'name': name,
      'bio': bio,
      'public_repos': public_repos,
      'avatar_url': avatar_url,
      'listRepo': listRepo.map((x) => x.toMap()).toList(),
      'listStarred': listStarred.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      login: map['login'] as String,
      name: map['name'] as String,
      bio: map['bio'] != null ? map['bio'] as String : null,
      public_repos: map['public_repos'] as int,
      avatar_url: map['avatar_url'] as String,
      listRepo: List<Repo>.from(
        (map['listRepo'] ?? []).map<Repo>(
          (x) => Repo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      listStarred: List<Repo>.from(
        (map['listStarred'] ?? []).map<Repo>(
          (x) => Repo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? login,
    String? name,
    String? bio,
    int? public_repos,
    String? avatar_url,
    List<Repo>? listRepo,
    List<Repo>? listStarred,
  }) {
    return User(
      login: login ?? this.login,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      public_repos: public_repos ?? this.public_repos,
      avatar_url: avatar_url ?? this.avatar_url,
      listRepo: listRepo ?? this.listRepo,
      listStarred: listStarred ?? this.listStarred,
    );
  }
}
