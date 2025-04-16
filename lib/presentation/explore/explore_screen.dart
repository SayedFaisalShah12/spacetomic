import 'package:flutter/material.dart';
import '../../core/constant/app_style.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF061A2D),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: AppStyle.bodyMedium.copyWith(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search space topics...',
                  hintStyle: AppStyle.bodyMedium.copyWith(
                    color: Colors.white54,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  filled: true,
                  fillColor: Color(0xFF0A1F2E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Grid of Space Content
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: exploreItems.length,
                itemBuilder: (context, index) {
                  final item = exploreItems[index];
                  return Card(
                    color: Color(0xFF0A1F2E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              item.imagePath,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: AppStyle.titleMedium.copyWith(
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                item.subtitle,
                                style: AppStyle.bodyMedium.copyWith(
                                  color: Colors.white70,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
        ),
      ),
    );
  }
}

class ExploreItem {
  final String title;
  final String subtitle;
  final String imagePath;

  const ExploreItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

final List<ExploreItem> exploreItems = [
  ExploreItem(
    title: 'Solar System',
    subtitle: 'Explore our cosmic neighborhood',
    imagePath: 'assets/images/astronaut.png',
  ),
  ExploreItem(
    title: 'Exoplanets',
    subtitle: 'Worlds beyond our solar system',
    imagePath: 'assets/images/astronaut.png',
  ),
  ExploreItem(
    title: 'Nebulae',
    subtitle: 'Cosmic clouds of gas and dust',
    imagePath: 'assets/images/astronaut.png',
  ),
  ExploreItem(
    title: 'Space Technology',
    subtitle: 'Latest innovations in space exploration',
    imagePath: 'assets/images/astronaut.png',
  ),
  ExploreItem(
    title: 'Astronomy',
    subtitle: 'Study of celestial objects',
    imagePath: 'assets/images/astronaut.png',
  ),
  ExploreItem(
    title: 'Space History',
    subtitle: 'Milestones in space exploration',
    imagePath: 'assets/images/astronaut.png',
  ),
];
