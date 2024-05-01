abstract class NavigationBarEvent {}

class ChangeScreen extends NavigationBarEvent {
  final int index;
  ChangeScreen({required this.index});
}