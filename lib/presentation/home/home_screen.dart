import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<MenuItemData> menuItems = const [
    MenuItemData(title: 'All', icon: Icons.all_inclusive, color: Colors.blue),
    MenuItemData(title: 'Stars', icon: Icons.star, color: Colors.amber),
    MenuItemData(title: 'Planets', icon: Icons.public, color: Colors.green),
    MenuItemData(
      title: 'Galaxies',
      icon: Icons.blur_circular,
      color: Colors.purple,
    ),
    MenuItemData(
      title: 'Missions',
      icon: Icons.rocket_launch,
      color: Colors.red,
    ),
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
      imageUrl:
          'https://www.nasa.gov/wp-content/uploads/2023/01/webb-first-images-full-1280.jpg',
      link: 'https://www.nasa.gov/webbfirstimages',
    ),
    SpaceContent(
      title: 'Mars Perseverance Rover',
      subtitle:
          'Exploring the Red Planet and searching for signs of ancient life',
      imageUrl:
          'https://www.nasa.gov/wp-content/uploads/2021/02/pia24427-16.jpg',
      link: 'https://www.nasa.gov/perseverance',
    ),
    SpaceContent(
      title: 'Hubble Space Telescope',
      subtitle: 'Over 30 years of breathtaking cosmic discoveries',
      imageUrl:
          'https://www.nasa.gov/wp-content/uploads/2021/06/hubble_servicing_4.jpg',
      link: 'https://www.nasa.gov/hubble',
    ),
  ];

  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spacetomic')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Horizontal Menu with Circle Avatars
          SizedBox(
            height: 100,
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder:
                  (_, currentIndex, __) => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: menuItems.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      final selected = index == currentIndex;
                      return GestureDetector(
                        onTap: () => selectedIndex.value = index,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    selected
                                        ? Border.all(
                                          color: item.color,
                                          width: 2,
                                        )
                                        : null,
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    selected
                                        ? item.color
                                        : item.color.withOpacity(0.2),
                                child: Icon(
                                  item.icon,
                                  color: selected ? Colors.white : item.color,
                                  size: 28,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.title,
                              style: TextStyle(
                                color: selected ? item.color : Colors.grey,
                                fontWeight:
                                    selected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
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
                      // Handle link opening
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
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
                              Text(
                                content.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                content.subtitle,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // Handle link opening
                                    },
                                    child: const Text('Learn More'),
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
      ),
    );
  }
}

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
