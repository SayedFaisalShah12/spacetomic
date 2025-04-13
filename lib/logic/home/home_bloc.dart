import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> menuItems = const [
    'All',
    'Stars',
    'Planets',
    'Galaxies',
    'Missions',
    'Black Holes',
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc()..add(LoadHomeContent()),
        ),
        BlocProvider<MenuBloc>(
          create: (_) => MenuBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Spacetomic Home"),
        ),
        body: Column(
          children: [
            BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                return SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: menuItems.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final selected = index == state.selectedIndex;
                      return GestureDetector(
                        onTap: () => context.read<MenuBloc>().add(SelectMenuItem(index)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: selected ? Colors.blueAccent : Colors.grey[800],
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
                );
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    return Center(
                      child: Text(
                        state.welcomeMessage,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.error));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
