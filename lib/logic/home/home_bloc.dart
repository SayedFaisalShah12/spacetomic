import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/neows.dart';
import '../../core/repositories/neo_repository.dart';

// Events
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadNeowsData extends HomeEvent {
  const LoadNeowsData();
}

// States
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Neows neows;
  final int selectedCategoryIndex;

  const HomeLoaded({required this.neows, this.selectedCategoryIndex = 0});

  @override
  List<Object?> get props => [neows, selectedCategoryIndex];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NeoRepository neoRepository;

  HomeBloc({required this.neoRepository}) : super(HomeInitial()) {
    on<LoadNeowsData>(_onLoadNeowsData);
  }

  Future<void> _onLoadNeowsData(
    LoadNeowsData event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());
      final neows = await neoRepository.getNearEarthObjects();
      emit(HomeLoaded(neows: neows));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
