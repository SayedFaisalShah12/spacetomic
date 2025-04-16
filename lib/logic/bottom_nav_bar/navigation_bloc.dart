import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(0)) {
    on<ChangeTab>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}
