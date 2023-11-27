import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/controller/notifier_toogle.dart';

class ToggleController {
  final NotifierToogle _notifier;
  final PageController _pageController;

  ToggleController(this._notifier, this._pageController) {
    _pageController.addListener(_handlePageChange);
    _notifier.addListener(_handleToggleChange);
  }

  void _handlePageChange() {
    if (_pageController.page == 0 && _notifier.value == false) {
      _notifier.value = true;
    } else if (_pageController.page == 1 && _notifier.value == true) {
      _notifier.value = false;
    }
  }

  void _handleToggleChange() {
    if (_notifier.value == true && _pageController.page != 0) {
      _pageController.jumpToPage(0);
    } else if (_notifier.value == false && _pageController.page != 1) {
      _pageController.jumpToPage(1);
    }
  }

  void dispose() {
    _pageController.removeListener(_handlePageChange);
    _notifier.removeListener(_handleToggleChange);
  }
}
