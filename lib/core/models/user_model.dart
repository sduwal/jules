import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? photoUrl;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [id, email, name, photoUrl];

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;
    return UserModel(
      id: snap.id,
      email: data['email'],
      name: data['name'],
      photoUrl: data['photoUrl'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}
