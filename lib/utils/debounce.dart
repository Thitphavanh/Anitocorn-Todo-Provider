// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/animation.dart';

class Debounce {
  final int millisconds;

  Debounce({
    required this.millisconds,
  });

  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: millisconds), action);
  }
}
