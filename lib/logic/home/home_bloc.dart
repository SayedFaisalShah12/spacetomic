import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadHomeContent>(_onLoadHomeContent);
    on<SelectCategory>(_onSelectCategory);
    on<LoadSpaceContent>(_onLoadSpaceContent);
  }

  Future<void> _onLoadHomeContent(
    LoadHomeContent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      // Simulating API call delay
      await Future.delayed(Duration(milliseconds: 500));

      final menuItems = [
        MenuItem(title: 'All', icon: 'all_inclusive'),
        MenuItem(title: 'Planets', icon: 'public'),
        MenuItem(title: 'Stars', icon: 'star'),
        MenuItem(title: 'Galaxies', icon: 'blur_circular'),
        MenuItem(title: 'Missions', icon: 'rocket_launch'),
      ];

      final spaceContents = [
        SpaceContent(
          title: 'The James Webb Space Telescope',
          subtitle:
              'Discover the latest images and findings from NASA\'s most powerful space telescope.',
          imagePath: 'assets/images/webb_telescope.jpg',
        ),
        SpaceContent(
          title: 'Mars Exploration',
          subtitle:
              'Follow the journey of Perseverance rover and its search for signs of ancient life.',
          imagePath: 'assets/images/mars_rover.jpg',
        ),
        SpaceContent(
          title: 'Black Holes',
          subtitle:
              'Explore the mysteries of these cosmic phenomena that warp space and time.',
          imagePath: 'assets/images/black_hole.jpg',
        ),
        SpaceContent(
          title: 'International Space Station',
          subtitle:
              'Learn about life in space and ongoing research aboard the ISS.',
          imagePath: 'assets/images/iss.jpg',
        ),
      ];

      emit(
        state.copyWith(
          menuItems: menuItems,
          spaceContents: spaceContents,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: 'Failed to load home content: ${e.toString()}',
          isLoading: false,
        ),
      );
    }
  }

  void _onSelectCategory(SelectCategory event, Emitter<HomeState> emit) {
    try {
      emit(state.copyWith(selectedCategoryIndex: event.index, error: null));

      // Here you can add logic to filter content based on selected category
      add(LoadSpaceContent());
    } catch (e) {
      emit(state.copyWith(error: 'Failed to select category: ${e.toString()}'));
    }
  }

  Future<void> _onLoadSpaceContent(
    LoadSpaceContent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      // Simulating API call delay
      await Future.delayed(Duration(milliseconds: 500));

      // Here you would typically fetch content based on the selected category
      // For now, we'll use the same content for all categories
      final filteredContent = state.spaceContents;

      emit(state.copyWith(spaceContents: filteredContent, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          error: 'Failed to load space content: ${e.toString()}',
          isLoading: false,
        ),
      );
    }
  }
}

class MenuItem {
  final String title;
  final String icon;

  const MenuItem({required this.title, required this.icon});
}

class SpaceContent {
  final String title;
  final String subtitle;
  final String imagePath;

  const SpaceContent({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}
