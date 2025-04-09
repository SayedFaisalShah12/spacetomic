import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../logic/bottom_nav_bar/navigation_state.dart';
import 'navigation_cubit.dart'; // import your cubit

class BottomNavBar extends StatelessWidget {
  final List<Widget> screens = [
    Center(child: Text("Home")),
    Center(child: Text("Gallery")),
    Center(child: Text("Search")),
    Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: screens[state],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GNav(
                selectedIndex: state,
                onTabChange: (index) {
                  context.read<NavigationCubit>().selectTab(index);
                },
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.deepPurple.shade800,
                gap: 8,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                tabs: const [
                  GButton(icon: Icons.home, text: 'Home'),
                  GButton(icon: Icons.image, text: 'Gallery'),
                  GButton(icon: Icons.search, text: 'Search'),
                  GButton(icon: Icons.settings, text: 'Settings'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
