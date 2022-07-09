import 'package:flutter_ruang_nelayan/models/jasa_pengerjaan_model.dart';
import 'package:flutter_ruang_nelayan/models/jenis_ikan_model.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';

class HasilTangkapanModel {
  int? id, idJasaPengerjaanIkan, idUser, idJenisIkan;
  String? namaIkan, gambar;
  DateTime? createdAt, updatedAt;
  double? harga;
  int? jumlah;
  List<JasaPengerjaanModel>? jenisPengerjaanIkan;
  JenisIkanModel? jenisIkan;
  UserModel? users;

  HasilTangkapanModel({
    this.id,
    this.namaIkan,
    this.idJenisIkan,
    this.jumlah,
    this.harga,
    this.gambar,
    this.idJasaPengerjaanIkan,
    this.jenisPengerjaanIkan,
    this.jenisIkan,
    this.createdAt,
    this.updatedAt,
    this.users,
  });

  HasilTangkapanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaIkan = json['nama_ikan'];
    idJenisIkan = json['id_jenis_ikan'];
    jumlah = int.parse(json['jumlah'].toString());
    harga = double.parse(json['harga'].toString());
    gambar = json['gambar'];
    idJasaPengerjaanIkan = json['id_jasa_pengerjaan_ikan'];

    // null check for jasa pengerjaan ikan
    if (json['jenis_pengerjaan_ikan'] == null) {
      jenisPengerjaanIkan = null;
    } else {
      jenisPengerjaanIkan = json['jenis_pengerjaan_ikan']
          .map<JasaPengerjaanModel>((item) =>
              JasaPengerjaanModel.fromJson(item['jasa_pengerjaan_ikan']))
          .toList();
    }

    // null check for jenis ikan
    if (json['jenis_ikan'] == null) {
      jenisIkan = null;
    } else {
      jenisIkan = JenisIkanModel.fromJson(json['jenis_ikan']);
    }

    // null check for jasa users
    if (json['users'] == null) {
      jenisIkan = null;
    } else {
      users = UserModel.fromJson(json['users']);
    }

    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_ikan': namaIkan,
      'id_jenis_ikan': idJenisIkan,
      'jumlah': jumlah,
      'harga': harga,
      'gambar': gambar,
      'id_jasa_pengerjaan_ikan': idJasaPengerjaanIkan,
      'jenis_pengerjaan_ikan':
          jenisPengerjaanIkan!.map((items) => items.toJson()).toList(),
      'jenis_ikan': jenisIkan!.toJson(),
      'users': users!.toJson(),
      'created_at': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
