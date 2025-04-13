abstract class MenuEvent {}

class SelectMenuItem extends MenuEvent {
  final int index;
  SelectMenuItem(this.index);
}
