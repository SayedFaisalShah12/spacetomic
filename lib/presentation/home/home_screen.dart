import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/models/neows.dart';
import '../../core/repositories/neo_repository.dart';
import '../../logic/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HomeBloc(neoRepository: context.read<NeoRepository>())
                ..add(const LoadNeowsData()),
      child: const HomeContent(),
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Near Earth Objects',
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
                'Hazardous',
                'Close',
                'Large',
                'Recent',
              ];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        index == 0
                            ? Colors.deepPurpleAccent
                            : const Color(0xFF0A1F2E),
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
                color: const Color(0xFF0A1F2E),
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
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Hazardous: ${neo.isPotentiallyHazardousAsteroid ?? false ? 'Yes' : 'No'}',
                        style: TextStyle(
                          color:
                              neo.isPotentiallyHazardousAsteroid ?? false
                                  ? Colors.red
                                  : Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Absolute Magnitude: ${neo.absoluteMagnitudeH?.toStringAsFixed(2) ?? 'N/A'}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      if (neo.estimatedDiameter?.kilometers != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Estimated Diameter: ${neo.estimatedDiameter!.kilometers!.estimatedDiameterMin?.toStringAsFixed(2)} - ${neo.estimatedDiameter!.kilometers!.estimatedDiameterMax?.toStringAsFixed(2)} km',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                      if (neo.closeApproachData?.isNotEmpty ?? false) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Closest Approach: ${neo.closeApproachData!.first.closeApproachDate ?? 'N/A'}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Miss Distance: ${(double.tryParse(neo.closeApproachData!.first.missDistance?.kilometers ?? '0') ?? 0).toStringAsFixed(2)} km',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implement details navigation
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
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
    );
  }
}
