abstract class NavigationEvent {}

class ChangeTab extends NavigationEvent {
  final int index;
  ChangeTab(this.index);
}
