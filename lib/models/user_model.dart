class UserModel {
  int? id;
  String? name, noTelp, noKtp, avatar, token;

  UserModel({
    this.id,
    this.name,
    this.noTelp,
    this.noKtp,
    this.avatar,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    noTelp = json['no_hp'];
    noKtp = json['nik_ktp'];
    avatar = json['avatar'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'no_hp': noTelp,
      'nik_ktp': noKtp,
      'avatar': avatar,
      'token': token,
    };
  }
}
