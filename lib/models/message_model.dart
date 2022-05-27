class MessageModel {
  String? message;
  int? userId;
  int? nelayanId;
  String? userName;
  String? userImage;
  bool? isFromUser;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageModel({
    this.message,
    this.userId,
    this.nelayanId,
    this.userName,
    this.userImage,
    this.isFromUser,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    nelayanId = json['nelayanId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'nelayanId': nelayanId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
