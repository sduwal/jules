import 'package.cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final String id;
  final String name;
  final List<String> members;

  const Group({
    required this.id,
    required this.name,
    required this.members,
  });

  @override
  List<Object> get props => [id, name, members];

  factory Group.fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;
    return Group(
      id: snap.id,
      name: data['name'],
      members: List<String>.from(data['members']),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'members': members,
    };
  }
}
