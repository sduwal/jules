import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:splitr/core/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<UserModel> getUser({required String userId}) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      return UserModel.fromSnapshot(doc);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  Stream<List<UserModel>> searchUsers({required String query}) {
    return _firestore
        .collection('users')
        .where('email', isGreaterThanOrEqualTo: query)
        .where('email', isLessThanOrEqualTo: '$query\uf8ff')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
    });
  }
}
