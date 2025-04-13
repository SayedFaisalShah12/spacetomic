import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuState(0)) {
    on<SelectMenuItem>((event, emit) {
      emit(MenuState(event.index));
    });
  }
}
