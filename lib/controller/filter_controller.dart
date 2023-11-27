import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/models/repo.dart';

class FilterController extends ValueNotifier<List<Repo>> {
  FilterController(List<Repo> value) : super(value);

  void setOriginalList(List<Repo> originalList) {
    value = originalList;
    notifyListeners();
  }

  void filterByName(String filter, List<Repo> originalList) {
    if (filter.isEmpty) {
      value = originalList;
    } else {
      final filteredList = originalList
          .where(
              (repo) => repo.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
      value = filteredList;
    }
    notifyListeners();
  }
}
