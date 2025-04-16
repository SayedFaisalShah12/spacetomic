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
        child: Column(
          children: [
            // Horizontal Menu
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Container(
                    margin: EdgeInsets.only(right: 12),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0A1F2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(item.icon, color: Colors.white70),
                          SizedBox(width: 8),
                          Text(item.title, style: AppStyle.bodyMedium),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Content List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
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
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    backgroundColor: Colors.deepPurpleAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
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
              ),
            ),
          ],
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

final List<MenuItem> menuItems = [
  MenuItem(title: 'All', icon: Icons.all_inclusive),
  MenuItem(title: 'Planets', icon: Icons.public),
  MenuItem(title: 'Stars', icon: Icons.star),
  MenuItem(title: 'Galaxies', icon: Icons.blur_circular),
  MenuItem(title: 'Missions', icon: Icons.rocket_launch),
];

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
