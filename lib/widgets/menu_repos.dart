import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/core/app_colors.dart';
import 'package:teste_vaga_dunnas/core/app_text.dart';
import 'package:teste_vaga_dunnas/controller/notifier_toogle.dart';
import 'package:teste_vaga_dunnas/models/user.dart';

class MenuRepos extends StatelessWidget {
  const MenuRepos({super.key, required this.notifier, required this.user});
  final NotifierToogle notifier;
  final User user;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: notifier.value
                              ? const BorderSide(
                                  width: 5, color: AppColors.rustyOrange)
                              : const BorderSide(
                                  width: 3, color: AppColors.paleGrey))),
                  child: TextButton(
                    onPressed: () =>
                        !notifier.value ? notifier.toggleValue() : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Repos',
                          style: !notifier.value
                              ? AppText.regular(22)
                              : AppText.bold(22),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.whiteTwo,
                          child: Text('${user.public_repos}'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: !notifier.value
                              ? const BorderSide(
                                  width: 5, color: AppColors.rustyOrange)
                              : const BorderSide(
                                  width: 3, color: AppColors.paleGrey))),
                  child: TextButton(
                    onPressed: () =>
                        notifier.value ? notifier.toggleValue() : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Starred',
                          style: !notifier.value
                              ? AppText.regular(22)
                              : AppText.bold(22),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.whiteTwo,
                          child: Text('${user.listStarred.length}'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
