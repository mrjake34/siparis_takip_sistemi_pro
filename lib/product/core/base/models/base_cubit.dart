import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T> extends Cubit<T> {
  BaseCubit(super.state);

  void safeEmit(T state) {
    super.emit(state);
  }
}
