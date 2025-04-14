import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bottom_nav_bar/navigation_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<String> menuItems = [
    'All',
    'Planets',
    'Stars',
    'Galaxies',
    'Nebulae',
  ];
  final List<Map<String, String>> spaceContent = [
    {
      'image': 'assets/images/space1.png',
      'title': 'Mars Exploration',
      'subtitle': 'Discover the Red Planet',
    },
    {
      'image': 'assets/images/space2.png',
      'title': 'Solar System',
      'subtitle': 'Journey through our cosmic neighborhood',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Horizontal Menu
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text(
                      menuItems[index],
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          // Space Content List
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: spaceContent.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      spaceContent[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                    ListTile(
                      title: Text(spaceContent[index]['title']!),
                      subtitle: Text(spaceContent[index]['subtitle']!),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text('Learn More'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
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
