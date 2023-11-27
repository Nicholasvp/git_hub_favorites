import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/controller/filter_controller.dart';
import 'package:teste_vaga_dunnas/core/app_text.dart';
import 'package:teste_vaga_dunnas/models/user.dart';
import 'package:teste_vaga_dunnas/widgets/search_repo.dart';

class ListRepos extends StatelessWidget {
  const ListRepos({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final FilterController filterController = FilterController(user.listRepo);

    filterController.setOriginalList(user.listRepo);

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchRepo(
              filterController: filterController,
              list: user.listRepo,
            ),
            const SizedBox(
              height: 30,
            ),
            ValueListenableBuilder(
                valueListenable: filterController,
                builder: (context, filteredList, _) {
                  return SizedBox(
                    width: double.infinity,
                    height: 350,
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        var repo = filteredList[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                repo.name,
                                style: AppText.bold(25, color: Colors.blue),
                              ),
                              subtitle: Text(repo.description),
                            ),
                            Row(
                              children: [
                                Flexible(
                                    child: ListTile(
                                  leading: const Icon(Icons.code),
                                  title: Text(repo.language),
                                )),
                                Flexible(
                                    child: ListTile(
                                  leading: const Icon(Icons.fork_right_sharp),
                                  title: Text("${repo.forks_count}"),
                                )),
                              ],
                            ),
                            const Divider()
                          ],
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
