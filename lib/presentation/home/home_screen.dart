import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constant/app_style.dart';
import '../../logic/home/home_bloc.dart';
import '../../logic/home/home_event.dart';
import '../../logic/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHomeContent()),
      child: Scaffold(
        backgroundColor: Color(0xFF061A2D),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.error != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: ${state.error}',
                        style: AppStyle.bodyMedium.copyWith(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(LoadHomeContent());
                        },
                        child: Text('Retry', style: AppStyle.bodyMedium),
                      ),
                    ],
                  ),
                );
              }

              if (state.isLoading && state.menuItems.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            index == 0
                                ? Colors.deepPurpleAccent
                                : Color(0xFF0A1F2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.home, color: Colors.white, size: 24),
                              SizedBox(width: 12),
                              Text(
                                'Home',
                                style: AppStyle.bodyMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.explore,
                                color: Colors.white70,
                                size: 20,
                              ),
                              SizedBox(width: 16),
                              Icon(
                                Icons.settings,
                                color: Colors.white70,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem({required this.title, required this.icon});
}

class SpaceContent {
  final String title;
  final String subtitle;
  final String imagePath;

  const SpaceContent({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

final List<MenuItem> menuItems = List.generate(
  12,
  (index) => MenuItem(title: 'Home', icon: Icons.home),
);

final List<SpaceContent> spaceContents = [
  SpaceContent(
    title: 'The James Webb Space Telescope',
    subtitle:
        'Discover the latest images and findings from NASA\'s most powerful space telescope.',
    imagePath: 'assets/images/webb_telescope.jpg',
  ),
  SpaceContent(
    title: 'Mars Exploration',
    subtitle:
        'Follow the journey of Perseverance rover and its search for signs of ancient life.',
    imagePath: 'assets/images/mars_rover.jpg',
  ),
  SpaceContent(
    title: 'Black Holes',
    subtitle:
        'Explore the mysteries of these cosmic phenomena that warp space and time.',
    imagePath: 'assets/images/black_hole.jpg',
  ),
  SpaceContent(
    title: 'International Space Station',
    subtitle: 'Learn about life in space and ongoing research aboard the ISS.',
    imagePath: 'assets/images/iss.jpg',
  ),
];
