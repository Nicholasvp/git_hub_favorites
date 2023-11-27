import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/models/repo.dart';
import 'package:teste_vaga_dunnas/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GithubService {
  Future<User?> getUser(String username) async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/$username'));

    if (response.statusCode == 200) {
      final user = User.fromMap(json.decode(response.body));

      final repos = await getRepos(username);
      final starreds = await getStarreds(username);

      var userUpdate = user.copyWith(listRepo: repos, listStarred: starreds);

      debugPrint(userUpdate.toMap().toString());
      return userUpdate;
    } else {
      return null;
    }
  }

  Future<User?> getUserTester(String username) async {
    return User(
        login: 'Nicholasvp',
        name: 'Nicholas Vinicius',
        public_repos: 38,
        avatar_url: 'https://avatars.githubusercontent.com/u/116972220?v=4',
        listRepo: [
          Repo(
              name: 'app-task',
              description: '',
              stargazers_count: 30,
              forks_count: 32,
              language: 'Dart'),
          Repo(
              name: 'bola',
              description: '',
              stargazers_count: 40,
              forks_count: 800,
              language: 'Dart'),
        ],
        listStarred: [
          Repo(
              name: 'app-task',
              description: '',
              stargazers_count: 2,
              forks_count: 50,
              language: 'Dart'),
          Repo(
              name: 'bola',
              description: '',
              stargazers_count: 9,
              forks_count: 6,
              language: 'Dart'),
        ]);
  }

  Future<List<Repo>> getRepos(String username) async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/$username/repos'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Repo> repos = data.map((repoData) {
        return Repo.fromMap(repoData);
      }).toList();

      return repos;
    } else {
      throw Exception('Failed to load repos');
    }
  }

  Future<List<Repo>> getStarreds(String username) async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/$username/starred'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Repo> repos = data.map((repoData) {
        return Repo.fromMap(repoData);
      }).toList();

      return repos;
    } else {
      throw Exception('Failed to load repos');
    }
  }
}
