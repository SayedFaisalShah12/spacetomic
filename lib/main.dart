import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacetomic/logic/bottom_nav_bar/navigation_bloc.dart';
import 'package:spacetomic/presentation/home/home_screen.dart';
import 'package:spacetomic/presentation/onboarding/onboarding_screen.dart';
import 'package:spacetomic/presentation/root_screen.dart';
import 'package:spacetomic/presentation/splash/splash_screen.dart';
import 'core/repositories/neo_repository.dart';
import 'core/services/neo_api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(enabled: true, builder: (_) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create:
              (context) => NeoApiService(
                apiKey: 'YOUR_NASA_API_KEY', // Replace with your actual API key
              ),
        ),
        RepositoryProvider(
          create:
              (context) =>
                  NeoRepository(neoApiService: context.read<NeoApiService>()),
        ),
      ],
      child: BlocProvider(
        create: (context) => NavigationBloc(),
        child: MaterialApp(
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
            '/splash': (context) => const SplashScreen(),
            '/onboarding': (context) => const OnboardingScreen(),
            '/home': (context) => const RootScreen(),
          },
        ),
      ),
    );
  }
}
