import 'package:flutter/material.dart';
import '../../core/constant/app_style.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF061A2D),
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Settings',
            style: AppStyle.displayMedium.copyWith(color: Colors.white),
          ),
          SizedBox(height: 24),
          _buildSettingsSection(
            title: 'Account',
            children: [
              _buildSettingsTile(
                icon: Icons.person,
                title: 'Profile',
                onTap: () {},
              ),
              _buildSettingsTile(
                icon: Icons.notifications,
                title: 'Notifications',
                onTap: () {},
              ),
              _buildSettingsTile(
                icon: Icons.security,
                title: 'Privacy',
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 24),
          _buildSettingsSection(
            title: 'Preferences',
            children: [
              _buildSettingsTile(
                icon: Icons.dark_mode,
                title: 'Dark Mode',
                trailing: Switch(value: true, onChanged: (value) {}),
              ),
              _buildSettingsTile(
                icon: Icons.language,
                title: 'Language',
                trailing: Text('English', style: AppStyle.bodyMedium),
              ),
              _buildSettingsTile(
                icon: Icons.storage,
                title: 'Storage',
                trailing: Text('Clear Cache', style: AppStyle.bodyMedium),
              ),
            ],
          ),
          SizedBox(height: 24),
          _buildSettingsSection(
            title: 'About',
            children: [
              _buildSettingsTile(
                icon: Icons.info,
                title: 'About App',
                onTap: () {},
              ),
              _buildSettingsTile(
                icon: Icons.star,
                title: 'Rate App',
                onTap: () {},
              ),
              _buildSettingsTile(
                icon: Icons.share,
                title: 'Share App',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.titleMedium.copyWith(color: Colors.white70),
        ),
        SizedBox(height: 8),
        Card(color: Color(0xFF0A1F2E), child: Column(children: children)),
      ],
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: AppStyle.bodyMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
