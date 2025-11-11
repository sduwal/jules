import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:splitr/features/expenses/data/expense_model.dart';

class ExpenseRepository {
  final FirebaseFirestore _firestore;

  ExpenseRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> createExpense({
    required String groupId,
    required String description,
    required double amount,
    required String paidBy,
    required List<String> participants,
  }) async {
    try {
      await _firestore.collection('groups').doc(groupId).collection('expenses').add({
        'description': description,
        'amount': amount,
        'paidBy': paidBy,
        'participants': participants,
        'createdAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Failed to create expense: $e');
    }
  }

  Stream<List<Expense>> getExpenses({required String groupId}) {
    return _firestore
        .collection('groups')
        .doc(groupId)
        .collection('expenses')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Expense.fromSnapshot(doc)).toList();
    });
  }
}
