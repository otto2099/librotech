import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

bool isIOS = Platform.isIOS ? true : false;

class Debouncer {
  final Duration duration;
  Timer? _timer;

  Debouncer({required this.duration});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  void cancel() {
    _timer?.cancel();
  }
}
