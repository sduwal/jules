import 'package:flutter/material.dart';

class GroupExpensesScreen extends StatelessWidget {
  const GroupExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hawaii Trip 🌺'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // User Status Banner
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overall, you are owed \$18.50',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    const Text('You are all settled up with 2 people.'),
                  ],
                ),
              ),
            ),
          ),
          // Tabs
          DefaultTabController(
            length: 2,
            child: TabBar(
              tabs: [
                Tab(text: 'Expenses'),
                Tab(text: 'Balances'),
              ],
            ),
          ),
          // Expense List
          Expanded(
            child: ListView(
              children: [
                _buildDateSeparator('October 26'),
                _buildExpenseListItem(
                  icon: Icons.receipt_long,
                  title: 'Dinner at The Place',
                  subtitle: 'You paid',
                  amount: '\$120.50',
                  owedAmount: 'you are owed \$80.25',
                  owedColor: Colors.green,
                ),
                _buildExpenseListItem(
                  icon: Icons.shopping_cart,
                  title: 'Groceries',
                  subtitle: 'Alex paid',
                  amount: '\$85.20',
                  owedAmount: 'you owe \$21.30',
                  owedColor: Colors.red,
                ),
                _buildDateSeparator('October 25'),
                _buildExpenseListItem(
                  icon: Icons.surfing,
                  title: 'Surfboard Rental',
                  subtitle: 'Sarah paid',
                  amount: '\$60.00',
                  owedAmount: 'you owe \$15.00',
                  owedColor: Colors.red,
                ),
                _buildExpenseListItem(
                  icon: Icons.local_bar,
                  title: 'Beachside Drinks',
                  subtitle: 'You paid',
                  amount: '\$45.50',
                  owedAmount: 'you are owed \$25.25',
                  owedColor: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Add Expense'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDateSeparator(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        date.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildExpenseListItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required String owedAmount,
    required Color owedColor,
  }) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount),
          Text(
            owedAmount,
            style: TextStyle(color: owedColor),
          ),
        ],
      ),
    );
  }
}
