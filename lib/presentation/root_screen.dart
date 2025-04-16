import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/bottom_nav_bar/navigation_bloc.dart';
import '../widget/bottom_nav_bar/bottom_nav_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: const CustomBottomNavBar(),
    );
  }
}
