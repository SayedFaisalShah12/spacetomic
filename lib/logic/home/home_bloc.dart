import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/home/home_event.dart';
import '../../logic/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeContent>((event, emit) async {
      emit(HomeLoading());
      await Future.delayed(const Duration(seconds: 2)); // Simulate loading
      try {
        emit(HomeLoaded(welcomeMessage: "👨‍🚀 Welcome to Spacetomic!"));
      } catch (e) {
        emit(HomeError(error: "Failed to load home data"));
      }
    });
  }
}
