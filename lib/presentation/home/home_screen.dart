import 'package:flutter/material.dart';
import '../../core/constant/app_style.dart';
import '../../widget/bottom_nav_bar/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF061A2D),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      index == 0 ? Colors.deepPurpleAccent : Color(0xFF0A1F2E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                        Icon(Icons.explore, color: Colors.white70, size: 20),
                        SizedBox(width: 16),
                        Icon(Icons.settings, color: Colors.white70, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
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
