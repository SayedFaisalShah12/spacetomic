import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacetomic/presentation/home/home_screen.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadHomeContent>(_onLoadHomeContent);
    on<SelectCategory>(_onSelectCategory);
    on<LoadSpaceContent>(_onLoadSpaceContent);
  }

  void _onLoadHomeContent(LoadHomeContent event, Emitter<HomeState> emit) {
    emit(state.copyWith(menuItems: menuItems, spaceContents: spaceContents));
  }

  void _onSelectCategory(SelectCategory event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedCategoryIndex: event.index));
  }

  void _onLoadSpaceContent(LoadSpaceContent event, Emitter<HomeState> emit) {
    // Here you can add logic to load space content from an API or database
    emit(state.copyWith(spaceContents: spaceContents));
  }
}
