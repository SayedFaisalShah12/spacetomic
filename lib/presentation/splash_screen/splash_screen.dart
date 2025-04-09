import 'package:flutter/material.dart';
import 'package:spacetomic/widget/bottom_nav_bar/bottom_nav_bar.dart';
import '../../core/constant/app_color.dart';
import '../../core/constant/app_style.dart';
import '../../widget/dotted_circle.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Astronaut image
              Stack(
                alignment: Alignment.center,
                children: [
                  // Circle orbit dots
                  SizedBox(
                    width: 280,
                    height: 280,
                    child: CustomPaint(
                      painter: DottedCirclePainter(),
                    ),
                  ),
                  Image.asset(
                    'assets/images/astronaut.png',
                    width: 240,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Title
              Text("SPACE", style: AppStyle.displayLarge),
              const SizedBox(height: 8),
              Text("Knowledge", style: AppStyle.titleMedium),

              const SizedBox(height: 48),

              // Go Menu button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF061A2D),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomBottomNavBar()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Go menu", style: AppStyle.bodyLarge),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
