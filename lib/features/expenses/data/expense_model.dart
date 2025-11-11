import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  final String id;
  final String description;
  final double amount;
  final String paidBy;
  final List<String> participants;
  final Timestamp createdAt;

  const Expense({
    required this.id,
    required this.description,
    required this.amount,
    required this.paidBy,
    required this.participants,
    required this.createdAt,
  });

  @override
  List<Object> get props =>
      [id, description, amount, paidBy, participants, createdAt];

  factory Expense.fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;
    return Expense(
      id: snap.id,
      description: data['description'],
      amount: data['amount'],
      paidBy: data['paidBy'],
      participants: List<String>.from(data['participants']),
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'description': description,
      'amount': amount,
      'paidBy': paidBy,
      'participants': participants,
      'createdAt': createdAt,
    };
  }
}
