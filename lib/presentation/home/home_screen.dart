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

          // You can add featured NASA image / content here
          Expanded(
            child: Center(
              child: Text(
                '🌌 Welcome to Spacetomic!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
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
