import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Explore',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildExploreCard(
                    title: _getExploreTitle(index),
                    subtitle: _getExploreSubtitle(index),
                    icon: _getExploreIcon(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Card(
      color: Colors.grey[900],
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Colors.blue),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getExploreTitle(int index) {
    final titles = [
      'Planets',
      'Stars',
      'Galaxies',
      'Black Holes',
      'Space Missions',
      'Astronomy',
    ];
    return titles[index];
  }

  String _getExploreSubtitle(int index) {
    final subtitles = [
      'Explore our solar system',
      'Discover distant suns',
      'Journey through galaxies',
      'Unravel cosmic mysteries',
      'Follow space exploration',
      'Learn about the universe',
    ];
    return subtitles[index];
  }

  IconData _getExploreIcon(int index) {
    final icons = [
      Icons.public,
      Icons.star,
      Icons.blur_circular,
      Icons.auto_awesome,
      Icons.rocket_launch,
      Icons.science,
    ];
    return icons[index];
  }
}
