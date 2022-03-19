class UserModel {
  int? id;
  String? name, noTelp, alamat, noKtp, avatar, role, token;

  UserModel({
    this.id,
    this.name,
    this.noTelp,
    this.noKtp,
    this.alamat,
    this.avatar,
    this.role,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    noTelp = json['no_hp'];
    alamat = json['alamat'];
    noKtp = json['nik_ktp'];
    avatar = json['avatar'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'no_hp': noTelp,
      'nik_ktp': noKtp,
      'alamat': alamat,
      'avatar': avatar,
      'role': role,
      'token': token,
    };
  }
}
