import 'package:flutter/material.dart';
import 'package:spacetomic/core/constant/app_style.dart';
import 'package:spacetomic/widget/bottom_nav_bar/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavBar();
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        // Horizontal Menu
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: menuItems.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return GestureDetector(
                onTap: () {
                  // Handle menu item tap
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: item.color.withOpacity(0.2),
                        boxShadow: [
                          BoxShadow(
                            color: item.color.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: item.color.withOpacity(0.2),
                        child: Icon(item.icon, color: item.color, size: 28),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(item.title, style: AppStyle.labelSmall),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 24),

        // Space Content List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: spaceContents.length,
            itemBuilder: (context, index) {
              final content = spaceContents[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {
                    // Handle content tap
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          content.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey[300],
                              child: const Icon(Icons.error_outline),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(content.title, style: AppStyle.titleLarge),
                            const SizedBox(height: 8),
                            Text(content.subtitle, style: AppStyle.titleMedium),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Handle learn more
                                  },
                                  child: Text(
                                    'Learn More',
                                    style: AppStyle.labelLarge,
                                  ),
                                ),
                              ],
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
    );
  }
}

final List<MenuItemData> menuItems = const [
  MenuItemData(
    title: 'All',
    icon: Icons.all_inclusive,
    color: Colors.deepPurpleAccent,
  ),
  MenuItemData(title: 'Stars', icon: Icons.star, color: Colors.amber),
  MenuItemData(title: 'Planets', icon: Icons.public, color: Colors.green),
  MenuItemData(
    title: 'Galaxies',
    icon: Icons.blur_circular,
    color: Colors.purple,
  ),
  MenuItemData(title: 'Missions', icon: Icons.rocket_launch, color: Colors.red),
  MenuItemData(
    title: 'Black Holes',
    icon: Icons.radar,
    color: Colors.deepPurple,
  ),
];

final List<SpaceContent> spaceContents = const [
  SpaceContent(
    title: 'James Webb Space Telescope',
    subtitle:
        'NASA\'s revolutionary space telescope capturing stunning images of the universe',
    imageUrl: 'assets/images/webb_telescope.png',
    link: 'https://www.nasa.gov/webbfirstimages',
  ),
  SpaceContent(
    title: 'Mars Perseverance Rover',
    subtitle:
        'Exploring the Red Planet and searching for signs of ancient life',
    imageUrl: 'assets/images/mars_rover.png',
    link: 'https://www.nasa.gov/perseverance',
  ),
  SpaceContent(
    title: 'Hubble Space Telescope',
    subtitle: 'Over 30 years of breathtaking cosmic discoveries',
    imageUrl: 'assets/images/hubble.png',
    link: 'https://www.nasa.gov/hubble',
  ),
];

class MenuItemData {
  final String title;
  final IconData icon;
  final Color color;

  const MenuItemData({
    required this.title,
    required this.icon,
    required this.color,
  });
}

class SpaceContent {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String link;

  const SpaceContent({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.link,
  });
}
