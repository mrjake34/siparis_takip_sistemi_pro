import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(super.state);

  void safeEmit(S state) {
    if (isClosed) return;
    // ignore: invalid_use_of_visible_for_testing_member
    super.emit(state);
  }
}
