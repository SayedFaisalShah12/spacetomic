import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/models/space_content.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) async {
      try {
        emit(HomeLoading());

        // Simulated content - replace with actual API call later
        final content = [
          const SpaceContent(
            imageUrl: 'https://example.com/mars.jpg',
            title: 'Mars Exploration',
            subtitle: 'Latest discoveries from the Red Planet',
            link: 'https://example.com/mars',
          ),
          const SpaceContent(
            imageUrl: 'https://example.com/jupiter.jpg',
            title: 'Jupiter\'s Moons',
            subtitle: 'Exploring the Galilean satellites',
            link: 'https://example.com/jupiter',
          ),
          const SpaceContent(
            imageUrl: 'https://example.com/blackhole.jpg',
            title: 'Black Holes',
            subtitle: 'Mysteries of the universe',
            link: 'https://example.com/blackhole',
          ),
        ];

        emit(HomeLoaded(content: content));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });

    on<ChangeCategory>((event, emit) {
      if (state is HomeLoaded) {
        final currentState = state as HomeLoaded;
        emit(currentState.copyWith(selectedCategoryIndex: event.index));
      }
    });
  }
}
