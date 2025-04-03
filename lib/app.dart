import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'core/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spacetomic',
        theme: spacetomicTheme, // Custom dark theme
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("This is the First Page")
      ),
    );
  }
}


