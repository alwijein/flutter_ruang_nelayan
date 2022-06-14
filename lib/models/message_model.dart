class MessageModel {
  String? message;
  int? senderId;
  int? reciverId;
  String? userName;
  String? userImage;
  bool? isRead;
  bool? isFromUser;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageModel({
    this.message,
    this.senderId,
    this.reciverId,
    this.userName,
    this.userImage,
    this.isRead,
    this.isFromUser,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    senderId = json['senderId'];
    reciverId = json['reciverId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isRead = json['isRead'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'senderId': senderId,
      'reciverId': reciverId,
      'userName': userName,
      'userImage': userImage,
      'usRead': isRead,
      'isFromUser': isFromUser,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
