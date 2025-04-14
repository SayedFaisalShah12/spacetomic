import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:spacetomic/presentation/home/home_screen.dart';
import 'package:spacetomic/presentation/onboarding/onboarding_screen.dart';
import 'package:spacetomic/presentation/splash/splash_screen.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spacetomic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
