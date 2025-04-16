import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constant/app_style.dart';
import '../../core/services/nasa_api_service.dart';
import '../../logic/apod/apod_bloc.dart';
import '../../logic/apod/apod_event.dart';
import '../../logic/apod/apod_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedMenuIndex = 0;
  late ApodBloc _apodBloc;

  @override
  void initState() {
    super.initState();
    _apodBloc = ApodBloc(NasaApiService());
  }

  @override
  void dispose() {
    _apodBloc.close();
    super.dispose();
  }

  Widget _buildApodImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: double.infinity,
            height: 300,
            color: Color(0xFF0A1F2E),
            child: Center(
              child: CircularProgressIndicator(
                value:
                    loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                color: Colors.deepPurpleAccent,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          print('Error loading image: $error');
          return Container(
            width: double.infinity,
            height: 300,
            color: Color(0xFF0A1F2E),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 48),
                SizedBox(height: 16),
                Text(
                  'Failed to load image',
                  style: AppStyle.bodyMedium.copyWith(color: Colors.red),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _apodBloc,
      child: Scaffold(
        backgroundColor: Color(0xFF061A2D),
        body: SafeArea(
          child: Column(
            children: [
              // App Title
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Spacetomic',
                  style: AppStyle.displayMedium.copyWith(
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),

              // Horizontal Menu
              Container(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              index == selectedMenuIndex
                                  ? Colors.deepPurpleAccent
                                  : Color(0xFF0A1F2E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedMenuIndex = index;
                          });
                          if (item.title == 'APOD') {
                            _apodBloc.add(LoadApod());
                          }
                        },
                        child: Row(
                          children: [
                            Icon(item.icon, color: Colors.white70),
                            SizedBox(width: 8),
                            Text(
                              item.title,
                              style: AppStyle.bodyMedium.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Content Area
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Builder(
                    builder: (context) {
                      if (menuItems[selectedMenuIndex].title == 'APOD') {
                        return BlocBuilder<ApodBloc, ApodState>(
                          builder: (context, state) {
                            if (state is ApodLoading) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.deepPurpleAccent,
                                ),
                              );
                            } else if (state is ApodLoaded) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildApodImage(
                                    state.apod.hdurl ?? state.apod.url,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    state.apod.title,
                                    style: AppStyle.titleLarge.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    state.apod.date,
                                    style: AppStyle.bodyMedium.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        state.apod.explanation,
                                        style: AppStyle.bodyMedium.copyWith(
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else if (state is ApodError) {
                              return Center(
                                child: Text(
                                  'Error: ${state.message}',
                                  style: AppStyle.bodyMedium.copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                              );
                            }
                            return Center(
                              child: Text(
                                'Select APOD to view NASA\'s Astronomy Picture of the Day',
                                style: AppStyle.bodyMedium.copyWith(
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        );
                      } else {
                        // Original content list for other menu items
                        return ListView.builder(
                          itemCount: spaceContents.length,
                          itemBuilder: (context, index) {
                            final content = spaceContents[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 16),
                              child: Card(
                                color: Color(0xFF0A1F2E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                      child: Image.asset(
                                        content.imagePath,
                                        width: double.infinity,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            content.title,
                                            style: AppStyle.titleLarge.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            content.subtitle,
                                            style: AppStyle.bodyMedium.copyWith(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.deepPurpleAccent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: Text(
                                              'Learn More',
                                              style: AppStyle.bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
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

final List<MenuItem> menuItems = [
  MenuItem(title: 'All', icon: Icons.all_inclusive),
  MenuItem(title: 'APOD', icon: Icons.star),
  MenuItem(title: 'Planets', icon: Icons.public),
  MenuItem(title: 'Galaxies', icon: Icons.blur_circular),
  MenuItem(title: 'Missions', icon: Icons.rocket_launch),
];

final List<SpaceContent> spaceContents = [
  SpaceContent(
    title: 'The James Webb Space Telescope',
    subtitle:
        'Discover the latest images and findings from NASA\'s most powerful space telescope.',
    imagePath: 'assets/images/astronaut.png',
  ),
  SpaceContent(
    title: 'Mars Exploration',
    subtitle:
        'Follow the journey of Perseverance rover and its search for signs of ancient life.',
    imagePath: 'assets/images/astronaut.png',
  ),
  SpaceContent(
    title: 'Black Holes',
    subtitle:
        'Explore the mysteries of these cosmic phenomena that warp space and time.',
    imagePath: 'assets/images/astronaut.png',
  ),
  SpaceContent(
    title: 'International Space Station',
    subtitle: 'Learn about life in space and ongoing research aboard the ISS.',
    imagePath: 'assets/images/astronaut.png',
  ),
];
