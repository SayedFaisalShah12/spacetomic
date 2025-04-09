import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacetomic/presentation/splash_screen/splash_screen.dart';
import 'logic/bottom_nav_bar/navigation_bloc.dart';
import 'logic/bottom_nav_bar/navigation_event.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc()..add(ChangeTab(0)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spacetomic',
        home: const SplashScreen(),
      ),
    );
  }
}




