import 'package:bloc/bloc.dart';

sealed class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(super.state);

  void safeEmit(S state) {
    if (isClosed) return;
    // ignore: invalid_use_of_visible_for_testing_member
    super.emit(state);
  }
}
