import 'package:flutter/material.dart';
import '../../core/constant/app_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF061A2D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/images/profile_avatar.jpg',
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Space Explorer',
                      style: AppStyle.titleLarge.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'spaceexplorer@spacetomic.com',
                      style: AppStyle.bodyMedium.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              // Settings List
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF0A1F2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildSettingsItem(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildSettingsItem(
                      icon: Icons.favorite,
                      title: 'Favorites',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildSettingsItem(
                      icon: Icons.history,
                      title: 'History',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildSettingsItem(
                      icon: Icons.settings,
                      title: 'Settings',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // Logout Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: AppStyle.bodyMedium.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: AppStyle.bodyMedium.copyWith(color: Colors.white),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.white54),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, color: Colors.white12, indent: 16, endIndent: 16);
  }
}
