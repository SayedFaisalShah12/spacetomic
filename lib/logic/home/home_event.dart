abstract class HomeEvent {}

class LoadHomeContent extends HomeEvent {}

class SelectCategory extends HomeEvent {
  final int index;
  SelectCategory(this.index);
}

class LoadSpaceContent extends HomeEvent {}
