import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/models/space_content.dart';
import '../../logic/home/home_bloc.dart';
import '../../logic/home/home_event.dart' as events;
import '../../logic/home/home_state.dart' as states;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const events.LoadHomeData()),
      child: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, states.HomeState>(
          builder: (context, state) {
            if (state is states.HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }

            if (state is states.HomeError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            if (state is states.HomeLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Spacetomic',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildHorizontalMenu(context, state.selectedCategoryIndex),
                  Expanded(child: _buildContentList(context, state.content)),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildHorizontalMenu(BuildContext context, int selectedIndex) {
    final menuItems = [
      MenuItem(title: 'All', icon: Icons.all_inclusive),
      MenuItem(title: 'Planets', icon: Icons.public),
      MenuItem(title: 'Stars', icon: Icons.star),
      MenuItem(title: 'Galaxies', icon: Icons.blur_circular),
      MenuItem(title: 'Missions', icon: Icons.rocket_launch),
    ];

    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 8,
              right: index == menuItems.length - 1 ? 16 : 8,
            ),
            child: MaterialButton(
              onPressed: () {
                context.read<HomeBloc>().add(events.ChangeCategory(index));
              },
              color: isSelected ? Colors.blue : Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(item.icon, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    item.title,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContentList(BuildContext context, List<SpaceContent> content) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: content.length,
      itemBuilder: (context, index) {
        final item = content[index];
        return Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(item.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.subtitle,
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // TODO: Implement link handling
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.blue),
                      child: const Text('Learn More'),
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
