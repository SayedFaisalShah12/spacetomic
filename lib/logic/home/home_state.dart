import 'package:equatable/equatable.dart';
import '../../core/models/space_content.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final int selectedCategoryIndex;
  final List<SpaceContent> content;

  const HomeLoaded({this.selectedCategoryIndex = 0, this.content = const []});

  @override
  List<Object?> get props => [selectedCategoryIndex, content];

  HomeLoaded copyWith({
    int? selectedCategoryIndex,
    List<SpaceContent>? content,
  }) {
    return HomeLoaded(
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      content: content ?? this.content,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
