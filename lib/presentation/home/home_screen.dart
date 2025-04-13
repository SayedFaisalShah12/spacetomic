import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> menuItems = const [
    'All',
    'Stars',
    'Planets',
    'Galaxies',
    'Missions',
    'Black Holes',
  ];

  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spacetomic'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Horizontal Menu
          SizedBox(
            height: 50,
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (_, currentIndex, __) => ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: menuItems.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final selected = index == currentIndex;
                  return GestureDetector(
                    onTap: () => selectedIndex.value = index,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? Colors.deepPurple : Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        menuItems[index],
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.white70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
