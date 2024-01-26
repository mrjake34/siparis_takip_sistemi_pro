import 'dart:async';

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
