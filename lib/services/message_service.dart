part of 'services.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final loginState = GetStorage();

  Stream<List<MessageModel>> getMessagesByUserId(
      {required int userId, required int nelayanId}) {
    try {
      if (loginState.read('role').toString() != 'costumer') {
        return firestore
            .collection('messages')
            .where('userId', isEqualTo: nelayanId)
            .snapshots()
            .map((QuerySnapshot list) {
          var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
            print(message.data());
            return MessageModel.fromJson(
                message.data() as Map<String, dynamic>);
          }).toList();

          result.sort(
            (MessageModel a, MessageModel b) =>
                a.createdAt!.compareTo(b.createdAt!),
          );

          return result;
        });
      } else {
        return firestore
            .collection('messages')
            .where('nelayanId', isEqualTo: nelayanId)
            .snapshots()
            .map((QuerySnapshot list) {
          var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
            print(message.data());
            return MessageModel.fromJson(
                message.data() as Map<String, dynamic>);
          }).toList();

          result.sort(
            (MessageModel a, MessageModel b) =>
                a.createdAt!.compareTo(b.createdAt!),
          );

          return result;
        });
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    required UserModel user,
    required bool isFromUser,
    required int idNelayan,
    required String message,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': loginState.read('role').toString() != 'costumer'
            ? idNelayan
            : user.id,
        'nelayanId': loginState.read('role').toString() != 'costumer'
            ? user.id
            : idNelayan,
        'userName': user.name,
        'userImage': user.avatar,
        'isFromUser': isFromUser,
        'message': message,
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan Berhasil Dikirim!'),
      );
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim!');
    }
  }
}
