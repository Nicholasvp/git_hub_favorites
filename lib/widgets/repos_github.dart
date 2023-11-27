import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/controller/notifier_toogle.dart';
import 'package:teste_vaga_dunnas/controller/toogle_controller.dart';
import 'package:teste_vaga_dunnas/models/user.dart';
import 'package:teste_vaga_dunnas/widgets/list_repos.dart';
import 'package:teste_vaga_dunnas/widgets/list_starred.dart';
import 'package:teste_vaga_dunnas/widgets/menu_repos.dart';

class ReposGithub extends StatelessWidget {
  const ReposGithub({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final NotifierToogle notifier = NotifierToogle(true);

    final PageController pageController = PageController(initialPage: 0);

    ToggleController(notifier, pageController);

    return Column(
      children: [
        MenuRepos(
          user: user,
          notifier: notifier,
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              ListRepos(
                user: user,
              ),
              ListStarred(
                user: user,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
