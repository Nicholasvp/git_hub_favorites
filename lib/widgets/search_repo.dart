import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/controller/filter_controller.dart';
import 'package:teste_vaga_dunnas/core/app_colors.dart';
import 'package:teste_vaga_dunnas/models/repo.dart';

class SearchRepo extends StatelessWidget {
  const SearchRepo(
      {super.key, required this.list, required this.filterController});
  final List<Repo> list;
  final FilterController filterController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.slateGrey,
        ),
        hintText: 'Filter by name',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.slateGrey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.rustyOrange, width: 2)),
      ),
      onChanged: (value) {
        filterController.filterByName(value, list);
      },
    );
  }
}
