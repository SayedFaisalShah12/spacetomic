import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/home/home_bloc.dart';
import '../../widget/bottom_nav_bar/bottom_nav_bar.dart';
import '../../core/repositories/neo_repository.dart';
import '../../core/services/neo_api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => HomeBloc(
            neoRepository: NeoRepository(
              neoApiService: NeoApiService(
                apiKey: 'DEMO_KEY', // Replace with your NASA API key
              ),
            ),
          )..add(const LoadNeowsData()),
      child: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            const _AppBar(),
            const _CategoryMenu(),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                  if (state is HomeError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return const _ContentList();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Spacetomic',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _CategoryMenu extends StatelessWidget {
  const _CategoryMenu();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final isSelected =
                  state is HomeLoaded && state.selectedCategoryIndex == index;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangeCategory(index));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isSelected
                            ? const Color(0xFF1E1E1E)
                            : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        menuItems[index].icon,
                        color: isSelected ? Colors.white : Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        menuItems[index].title,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _ContentList extends StatelessWidget {
  const _ContentList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spaceContent.length,
      itemBuilder: (context, index) {
        final content = spaceContent[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          color: const Color(0xFF1E1E1E),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.network(
                  content.imageUrl,
                  height: 200,
                  width: double.infinity,
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
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content.subtitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF2E2E2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Learn More',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
  final String imageUrl;

  const SpaceContent({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}

final List<MenuItem> menuItems = [
  const MenuItem(title: 'All', icon: Icons.all_inclusive),
  const MenuItem(title: 'APOD', icon: Icons.image),
  const MenuItem(title: 'Neows', icon: Icons.rocket_launch),
];

final List<SpaceContent> spaceContent = [
  const SpaceContent(
    title: 'The Milky Way Galaxy',
    subtitle:
        'Our home galaxy, a barred spiral galaxy containing billions of stars.',
    imageUrl: 'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa',
  ),
  const SpaceContent(
    title: 'Mars Exploration',
    subtitle: 'Latest discoveries and missions to the Red Planet.',
    imageUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa',
  ),
  const SpaceContent(
    title: 'Black Holes',
    subtitle: 'Understanding these mysterious cosmic phenomena.',
    imageUrl: 'https://images.unsplash.com/photo-1446776858070-70c3d5ed6758',
  ),
];
