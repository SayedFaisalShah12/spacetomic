import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:spacetomic/core/constant/app_color.dart';
import 'package:spacetomic/presentation/home/home_screen.dart';
import '../../logic/bottom_nav_bar/navigation_bloc.dart';
import '../../logic/bottom_nav_bar/navigation_event.dart';
import '../../logic/bottom_nav_bar/navigation_state.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Center(child: Text('Likes Page', style: TextStyle(color: Colors.white))),
    Center(child: Text('Search Page', style: TextStyle(color: Colors.white))),
    Center(child: Text('Profile Page', style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFF061A2D),
          body: _widgetOptions.elementAt(state.selectedIndex),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Color(0xFF0A1F2E),
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
                  color: Colors.white,
                  tabs: [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.favorite, text: 'Likes'),
                    GButton(icon: Icons.search, text: 'Search'),
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
}
