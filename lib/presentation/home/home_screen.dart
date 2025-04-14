import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bottom_nav_bar/navigation_bloc.dart';
import '../../widget/bottom_nav_bar/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF061A2D),
          body: HomeContent(),
          bottomNavigationBar: CustomBottomNavBar(),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App Title
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Spacetomic',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),

        // Top Horizontal Menu
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(item.icon, color: item.color),
                      SizedBox(width: 8),
                      Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Space Content List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: spaceContents.length,
            itemBuilder: (context, index) {
              final content = spaceContents[index];
              return Card(
                margin: EdgeInsets.only(bottom: 16),
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
                      child: Image.network(
                        content.link,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.grey[800],
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.white54,
                              size: 50,
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.grey[800],
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.deepPurpleAccent,
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            content.subtitle,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 16),
                          TextButton(
                            onPressed: () {
                              // Handle link tap
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              backgroundColor: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Learn More',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
