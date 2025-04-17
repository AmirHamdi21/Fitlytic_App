// Settings Page (Image 2 & 3 combined)
import 'package:fitlytic/UI/Profile/support_page.dart';
import 'package:fitlytic/constants/custom_colors.dart';
import 'package:fitlytic/constants/custom_styles.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String profileVisibility = 'Public';
  String activityVisibility = 'Everyone';
  bool darkMode = true;
  bool workoutReminders = true;
  bool progressUpdates = true;
  bool achievementAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          hoverColor: MyColors.grey2,
          iconSize: 24.0,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1F2937),
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Account Settings
          _buildSettingsSection(
            icon: Icons.person,
            title: 'Account Settings',
            children: [
              _buildSettingItem(
                title: 'Profile Visibility',
                subtitle: 'Control who can see your profile',
                trailing: _buildDropdown(
                  value: profileVisibility,
                  items: ['Public', 'Friends Only', 'Private'],
                  onChanged: (value) {
                    setState(() {
                      profileVisibility = value!;
                    });
                  },
                ),
              ),
              _buildSettingItem(
                title: 'Email Notifications',
                subtitle: 'Receive email updates about your account',
                trailing: null,
              ),
            ],
          ),

          // Appearance
          _buildSettingsSection(
            icon: Icons.dark_mode,
            title: 'Appearance',
            children: [
              _buildSettingItem(
                title: 'Dark Mode',
                subtitle: 'Toggle dark mode on or off',
                trailing: Switch(
                  value: darkMode,
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                  activeColor: const Color(0xFF3B82F6),
                ),
              ),
            ],
          ),

          // Notifications
          _buildSettingsSection(
            icon: Icons.notifications,
            title: 'Notifications',
            children: [
              _buildSettingItem(
                title: 'Workout Reminders',
                subtitle: 'Get notified about scheduled workouts',
                trailing: Switch(
                  value: workoutReminders,
                  onChanged: (value) {
                    setState(() {
                      workoutReminders = value;
                    });
                  },
                  activeColor: const Color(0xFF3B82F6),
                ),
              ),
              _buildSettingItem(
                title: 'Progress Updates',
                subtitle: 'Receive updates about your fitness progress',
                trailing: Switch(
                  value: progressUpdates,
                  onChanged: (value) {
                    setState(() {
                      progressUpdates = value;
                    });
                  },
                  activeColor: const Color(0xFF3B82F6),
                ),
              ),
              _buildSettingItem(
                title: 'Achievement Alerts',
                subtitle: 'Get notified when you earn achievements',
                trailing: Switch(
                  value: achievementAlerts,
                  onChanged: (value) {
                    setState(() {
                      achievementAlerts = value;
                    });
                  },
                  activeColor: const Color(0xFF3B82F6),
                ),
              ),
            ],
          ),

          // Privacy
          _buildSettingsSection(
            icon: Icons.lock,
            title: 'Privacy',
            children: [
              _buildSettingItem(
                title: 'Activity Visibility',
                subtitle: 'Control who can see your activities',
                trailing: _buildDropdown(
                  value: activityVisibility,
                  items: ['Everyone', 'Friends', 'Only Me'],
                  onChanged: (value) {
                    setState(() {
                      activityVisibility = value!;
                    });
                  },
                ),
              ),
              _buildSettingItem(
                title: 'Data Sharing',
                subtitle: 'Manage how your data is shared',
                trailing: null,
              ),
            ],
          ),

          // Support button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  gradient: MyColors.customGradient),
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SupportPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Contact Support', style: customTitleStyle(16.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF374151),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: Colors.grey[400]),
                ),
                const SizedBox(width: 16),
                Text(title, style: customTitleStyle(18.0)),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required String subtitle,
    required Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: customTitleStyle(16.0)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF374151),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        value: value,
        onChanged: onChanged,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        style: const TextStyle(color: Colors.white),
        dropdownColor: const Color(0xFF374151),
        underline: Container(),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
      ),
    );
  }
}
