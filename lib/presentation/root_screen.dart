import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/bottom_nav_bar/navigation_bloc.dart';
import '../logic/bottom_nav_bar/navigation_state.dart';
import '../widget/bottom_nav_bar/bottom_nav_bar.dart';
import 'home/home_screen.dart';
import 'explore/explore_screen.dart';
import 'profile/profile_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        body: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.selectedIndex,
              children: const [HomeScreen(), ExploreScreen(), ProfileScreen()],
            );
          },
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
