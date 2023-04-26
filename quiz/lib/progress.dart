import 'package:flutter/material.dart';

class Progress {
  List<Widget> _scoreKipper = [];
  getWidget(Widget a) {
    _scoreKipper.add(a);
  }

  List<Widget> showProgress() {
    return [..._scoreKipper];
  }

  clearList() {
    _scoreKipper.clear();
  }
}
