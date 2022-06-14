part of 'services.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final loginState = GetStorage();

  Stream<List<MessageModel>> getMessagesByUserId(
      {required int userId, required int reciverId}) {
    List<MessageModel> resultt = [];
    try {
      return firestore
          .collection('messages')
          .where('senderId', whereIn: [userId, reciverId])
          // .where('senderId', isEqualTo: userId)
          // .where('reciverId', isEqualTo: reciverId)
          .snapshots()
          .map((QuerySnapshot list) {
            var result =
                list.docs.map<MessageModel>((DocumentSnapshot message) {
              print(message.data());

              return MessageModel.fromJson(
                  message.data() as Map<String, dynamic>);
            }).toList();

            result.sort(
              (MessageModel a, MessageModel b) =>
                  a.createdAt!.compareTo(b.createdAt!),
            );

            for (var data in result) {
              if (data.senderId == userId && data.reciverId == reciverId) {
                resultt.add(data);
              } else if (data.senderId == reciverId &&
                  data.reciverId == userId) {
                resultt.add(data);
              }
            }
            return resultt;
          });
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<List<MessageModel>> checkMassage({required int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('reciverId', isEqualTo: userId)
          .where('isRead', isEqualTo: false)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());

          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<List<MessageModel>> checkMassageOnce(
      {required int userId, required int reciverId}) {
    try {
      return firestore
          .collection('messages')
          .where('reciverId', isEqualTo: userId)
          .where('senderId', isEqualTo: reciverId)
          .where('isRead', isEqualTo: false)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateData({required int userId, required int reciverId}) async {
    try {
      await firestore
          .collection('messages')
          .where('reciverId', isEqualTo: userId)
          .where('senderId', isEqualTo: reciverId)
          .where('isRead', isEqualTo: false)
          .get()
          .then((querySnapshot) {
        print("sebelum id");

        for (var documentSnapshot in querySnapshot.docs) {
          print("data null");
          print("ini idnya: " + documentSnapshot.id.toString());
          documentSnapshot.reference.update({'isRead': true});
        }
      });
      print("success");
    } catch (e) {
      print("gagal");

      throw Exception(e);
    }

    //  var data = firestore
    //       .collection('messages')
    //       .where('reciverId', isEqualTo: userId)
    //       .where('senderId', isEqualTo: reciverId)
    //       .where('isRead', isEqualTo: false).get;
    //       var data1 = firestore.

    // QuerySnapshot querySnap = await FirebaseFirestore.instance
    //     .collection('messages')
    //     .where('reciverId', isEqualTo: userId)
    //     .where('isSenerId', isEqualTo: reciverId)
    //     .where('isRead', isEqualTo: false)
    //     .get();
    // QueryDocumentSnapshot doc = querySnap.docs[
    //     0]; // Assumption: the query returns only one document, THE doc you are looking for.
    // DocumentReference docRef = doc.reference;

    // await docRef.update({"isRead": true}).then((result) {
    //   print("new USer true");
    // }).catchError((onError) {
    //   print("onError");
    // });

    // firestore
    //     .collection('messages')
    //     .doc()
    //     .update({"isRead": false})
  }

  Future<void> addMessage({
    required UserModel user,
    required bool isFromUser,
    required int reciverId,
    required String message,
  }) async {
    try {
      firestore.collection('messages').add({
        'senderId': user.id,
        'reciverId': reciverId,
        'userName': user.name,
        'userImage': user.avatar,
        'isFromUser': isFromUser,
        'message': message,
        'isRead': false,
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
