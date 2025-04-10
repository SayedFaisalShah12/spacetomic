import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:spacetomic/presentation/home/home_screen.dart';
import '../../logic/bottom_nav_bar/navigation_bloc.dart';
import '../../logic/bottom_nav_bar/navigation_event.dart';
import '../../logic/bottom_nav_bar/navigation_state.dart';


class CustomBottomNavBar extends StatelessWidget {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    Text('Likes', style: optionStyle),
    Text('Search', style: optionStyle),
    Text('Profile', style: optionStyle),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 20,
            title: const Text('GoogleNavBar with BLoC'),
          ),
          body: Center(
            child: _widgetOptions[state.selectedIndex],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: [
                     GButton(icon: Icons.home, text: 'Home'),
                     GButton(icon: Icons.heart_broken, text: 'Likes'),
                     GButton(icon: Icons.search, text: 'Search'),
                     GButton(icon: Icons.person_2_outlined, text: 'Profile'),
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

