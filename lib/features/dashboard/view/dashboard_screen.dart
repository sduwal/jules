import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            // Placeholder for user profile picture
            backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Stats Cards
            Row(
              children: [
                _buildStatCard('Total balance', '\$50.00', Colors.black),
                const SizedBox(width: 16),
                _buildStatCard('You owe', '\$25.00', Colors.red),
                const SizedBox(width: 16),
                _buildStatCard('You are owed', '\$75.00', Colors.green),
              ],
            ),
            const SizedBox(height: 24),
            // Segmented Buttons
            SegmentedButton(
              segments: [
                ButtonSegment(value: 'owe', label: Text('You Owe')),
                ButtonSegment(value: 'owed', label: Text('You Are Owed')),
              ],
              selected: {'owe'},
              onSelectionChanged: (selection) {},
            ),
            const SizedBox(height: 24),
            // List of Balances
            Expanded(
              child: ListView(
                children: [
                  _buildBalanceListItem(
                    'Alex',
                    'Groceries',
                    '-\$25.00',
                    Colors.red,
                  ),
                  _buildBalanceListItem(
                    'Weekend Trip',
                    'Gas & Food',
                    '+\$60.00',
                    Colors.green,
                  ),
                  _buildBalanceListItem(
                    'Casey',
                    'Movie Tickets',
                    '+\$15.00',
                    Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String amount, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: color),
              ),
              const SizedBox(height: 8),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceListItem(
      String title, String subtitle, String amount, Color color) {
    return ListTile(
      leading: const CircleAvatar(
        // Placeholder for user/group picture
        backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        amount,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
