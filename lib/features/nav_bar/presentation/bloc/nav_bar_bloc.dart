import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_bar_event.dart';
import 'nav_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(const NavigationBarState()) {
    on<ChangeScreen>(_changeScreen);
  }

  FutureOr<void> _changeScreen(
      ChangeScreen event, Emitter<NavigationBarState> emit) {
    emit(state.copyWith(event.index));
  }
}
