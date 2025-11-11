import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Done'),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildProfileSummary(),
          const Divider(),
          _buildSectionHeader('Account'),
          _buildSettingsItem(Icons.person, 'Edit Profile'),
          _buildSettingsItem(Icons.lock, 'Change Password'),
          _buildSettingsItem(Icons.credit_card, 'Connected Accounts'),
          const Divider(),
          _buildSectionHeader('Notifications'),
          _buildNotificationSetting('Push Notifications', true),
          _buildNotificationSetting('Email Notifications', false),
          const Divider(),
          _buildSectionHeader('App & Legal'),
          _buildSettingsItem(Icons.help, 'Help & Support'),
          _buildSettingsItem(Icons.shield, 'Privacy Policy'),
          _buildSettingsItem(Icons.gavel, 'Terms of Service'),
          _buildAppVersion('App Version', '1.2.3'),
          const Divider(),
          _buildActions(),
        ],
      ),
    );
  }

  Widget _buildProfileSummary() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
          ),
          SizedBox(height: 16),
          Text(
            'Alex Johnson',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('alex.j@example.com'),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _buildNotificationSetting(String title, bool value) {
    return ListTile(
      leading: Icon(
        value ? Icons.notifications_active : Icons.notifications_off,
      ),
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: (bool newValue) {},
      ),
    );
  }

  Widget _buildAppVersion(String title, String version) {
    return ListTile(
      leading: const Icon(Icons.info),
      title: Text(title),
      trailing: Text(version),
    );
  }

  Widget _buildActions() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Log Out'),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {},
            child: const Text('Delete Account', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
