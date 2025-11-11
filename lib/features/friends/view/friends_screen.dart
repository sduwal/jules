import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildFriendListItem(
            name: 'Eleanor Pena',
            status: 'You are even',
            statusColor: Colors.green,
            imageUrl: 'https://i.pravatar.cc/150?img=1',
          ),
          _buildFriendListItem(
            name: 'Cameron Williamson',
            status: 'owes you \$12.50',
            statusColor: Colors.orange,
            imageUrl: 'https://i.pravatar.cc/150?img=2',
          ),
          _buildFriendListItem(
            name: 'Jane Cooper',
            status: 'you owe \$8.00',
            statusColor: Colors.blue,
            imageUrl: 'https://i.pravatar.cc/150?img=3',
          ),
          _buildFriendListItem(
            name: 'Wade Warren',
            status: 'You are even',
            statusColor: Colors.green,
            imageUrl: 'https://i.pravatar.cc/150?img=4',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFriendListItem({
    required String name,
    required String status,
    required Color statusColor,
    required String imageUrl,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 28,
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(status, style: TextStyle(color: statusColor)),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {},
      ),
    );
  }
}
