import 'package:equatable/equatable.dart';

class NavigationBarState extends Equatable {
  final int selectedPage;

  const NavigationBarState({this.selectedPage = 0});

  NavigationBarState copyWith(int? selectedPage) {
    return NavigationBarState(selectedPage: selectedPage ?? this.selectedPage);
  }

  @override
  List<Object?> get props => [selectedPage];
}
