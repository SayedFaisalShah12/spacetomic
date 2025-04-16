import 'package:equatable/equatable.dart';
import '../../core/models/neows.dart';

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
