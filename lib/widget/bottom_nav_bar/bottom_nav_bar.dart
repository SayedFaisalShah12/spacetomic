import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../logic/bottom_nav_bar/navigation_bloc.dart';
import '../../logic/bottom_nav_bar/navigation_event.dart';
import '../../logic/bottom_nav_bar/navigation_state.dart';


class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GNav(
            selectedIndex: state.selectedIndex,
            onTabChange: (index) {
              context.read<NavigationBloc>().add(NavigateToTab(index));
            },
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepPurple.shade700,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            gap: 8,
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.image, text: 'Gallery'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.settings, text: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
