import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

final class TimerFunction {
  TimerFunction._();

  static Future<T> startTimerFunction<T>({
    required T Function() onDone,
    int duration = 1,
  }) {
    final completer = Completer<T>();
    Timer(Duration(seconds: duration), () {
      completer.complete(onDone());
    });
    return completer.future;
  }
}

void main() {
  int newFunc() {
    return 250 * 2;
  }

  test('Test Text', () async {
    final reponse = await TimerFunction.startTimerFunction(
      onDone: newFunc,
      duration: 1,
    );

    expect(reponse, 500);
  });
}
