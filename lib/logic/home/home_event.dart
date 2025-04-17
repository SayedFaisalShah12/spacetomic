import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeData extends HomeEvent {
  const LoadHomeData();
}

class ChangeCategory extends HomeEvent {
  final int index;

  const ChangeCategory(this.index);

  @override
  List<Object?> get props => [index];
}
