import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/controller/filter_controller.dart';
import 'package:teste_vaga_dunnas/core/app_text.dart';
import 'package:teste_vaga_dunnas/models/user.dart';
import 'package:teste_vaga_dunnas/widgets/search_repo.dart';

class ListStarred extends StatelessWidget {
  const ListStarred({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final FilterController filterController =
        FilterController(user.listStarred);

    filterController.setOriginalList(user.listStarred);

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchRepo(
              filterController: filterController,
              list: user.listStarred,
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
                                  leading: Icon(Icons.star),
                                  title: Text("${repo.stargazers_count}"),
                                )),
                                Flexible(
                                    child: ListTile(
                                  leading: Icon(Icons.fork_right_sharp),
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
