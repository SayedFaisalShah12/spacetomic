abstract class NavigationEvent {}

class NavigateToTab extends NavigationEvent {
  final int index;
  NavigateToTab(this.index);
}
