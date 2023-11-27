import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/core/app_text.dart';

class ProfileGithub extends StatelessWidget {
  const ProfileGithub(
      {super.key, required this.name, this.bio, required this.imageUrl});

  final String name;
  final String? bio;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(imageUrl),
        ),
        Flexible(
          child: ListTile(
            title: Text(
              name,
              style: AppText.bold(22),
            ),
            subtitle: Text(
              bio ?? '',
              style: AppText.regular(16),
            ),
          ),
        ),
      ],
    );
  }
}
