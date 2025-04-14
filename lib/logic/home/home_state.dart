import 'package:spacetomic/presentation/home/home_screen.dart';

class HomeState {
  final int selectedCategoryIndex;
  final List<MenuItemData> menuItems;
  final List<SpaceContent> spaceContents;
  final bool isLoading;
  final String? error;

  const HomeState({
    this.selectedCategoryIndex = 0,
    this.menuItems = const [],
    this.spaceContents = const [],
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    int? selectedCategoryIndex,
    List<MenuItemData>? menuItems,
    List<SpaceContent>? spaceContents,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      menuItems: menuItems ?? this.menuItems,
      spaceContents: spaceContents ?? this.spaceContents,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
