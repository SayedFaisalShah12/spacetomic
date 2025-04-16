import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/models/neows.dart';
import '../../logic/home/home_bloc.dart'
    hide HomeState, HomeLoading, HomeError, HomeLoaded, LoadNeowsData;
import '../../logic/home/home_event.dart';
import '../../logic/home/home_state.dart';
import '../../widget/bottom_nav_bar/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => context.read<HomeBloc>()..add(const LoadNeowsData()),
      child: const CustomBottomNavBar(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, currentState) {
        if (currentState is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (currentState is HomeError) {
          return Center(child: Text('Error: ${currentState.message}'));
        }

        if (currentState is HomeLoaded) {
          return _buildContent(context, currentState.neows);
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildContent(BuildContext context, Neows neows) {
    final neos = neows.nearEarthObjects ?? [];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final categories = [
                    'All',
                    'Planets',
                    'Stars',
                    'Galaxies',
                    'Missions',
                  ];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            index == 0 ? Colors.blue : Colors.grey[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        categories[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: neos.length,
                itemBuilder: (context, index) {
                  final neo = neos[index];
                  return Card(
                    color: Colors.grey[900],
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            neo.name ?? 'Unknown Object',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Designation: ${neo.designation ?? 'N/A'}',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Hazardous: ${neo.isPotentiallyHazardousAsteroid ?? false ? 'Yes' : 'No'}',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Absolute Magnitude: ${neo.absoluteMagnitudeH ?? 'N/A'}',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement details navigation
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Learn More'),
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
      ),
    );
  }
}
