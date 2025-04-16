import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../logic/bottom_nav_bar/navigation_bloc.dart';
import '../../logic/bottom_nav_bar/navigation_event.dart';
import '../../logic/bottom_nav_bar/navigation_state.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/explore/explore_screen.dart';
import '../../presentation/profile/profile_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFF061A2D),
          body: IndexedStack(
            index: state.selectedIndex,
            children: _widgetOptions,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Color(0xFF061A2D),
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8,
                ),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.deepPurpleAccent,
                  color: Colors.white70,
                  tabs: [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.explore, text: 'Explore'),
                    GButton(icon: Icons.person, text: 'Profile'),
                  ],
                  selectedIndex: state.selectedIndex,
                  onTabChange: (index) {
                    context.read<NavigationBloc>().add(ChangeTab(index));
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];
}
