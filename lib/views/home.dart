import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/core/app_text.dart';
import 'package:teste_vaga_dunnas/services/github_service.dart';
import 'package:teste_vaga_dunnas/widgets/profile_github.dart';
import 'package:teste_vaga_dunnas/widgets/repos_github.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    final githubService = GithubService();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Row(
            children: [
              CircleAvatar(
                child: Image.network(
                  'https://seeklogo.com/images/G/github-logo-2E3852456C-seeklogo.com.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                ' Github',
                style: AppText.boldWhite(22),
              ),
              Text(
                ' profiles',
                style: AppText.regularWhite(22),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: githubService.getUser(username),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var user = snapshot.data;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: ProfileGithub(
                        name: user!.name, imageUrl: user.avatar_url),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: ReposGithub(
                    user: user,
                  ))
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
